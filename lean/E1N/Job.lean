module
public import E1N.Check
/-! # E1N.Job: jobs (chains of blocks), root chains, batches (core only)

**Data encoding** (`R22N.Bin7`, the native track's standard): a `String` of ASCII chars; char `i` carries payload bits
`[7i, 7i + 7)` (little-endian); payload byte `j` is bits `[8j, 8j + 8)`.  `dec7` yields `⌊7n/8⌋` bytes.

**Job data** (payload bytes): `u32` block count, then per block `u32` byte length, the block literal's bytes
(little-endian), `u32` record count, and one `u32` witness per header record: a later block `w` of the chain
(`glue`/`glue0`), or, for `w ≥` the block count, external child `w - count` (`glue` or `glue0` against its start key).

**Keys.** A job's key is its start state, the first block's header: bits `[0, 6 + lb + lb d)` in mode 0 (`[1]` mode, `[5] d`,
`[lb] pos`, `d × [lb]` labels), followed in mode 1 by the `3 nl` budget bits (`hdrLen`).  The checker verifies that the first
block starts with exactly this header.  `JobOK C sl UB key` depends only on these bits (`start_key`, `startOK_mod`), so the
refinement concludes it for the key.  Keys are below `2 ^ 1088` and compared through 136-byte strings (`keyBytes`).

Refinement (`R/`): `jobOK D key ext data = true → (∀ c ∈ ext, JobOK c) → JobOK key`. -/
@[expose] public section
namespace E1N

/-! ## The 7-bit decoder -/

/-- payload bytes of chars `[i, i + n)` of `s` (bytes of `s.toUTF8`), with `nb` pending bits in `acc` -/
def dec7Go (b : ByteArray) : Nat → Nat → Nat → Nat → ByteArray → ByteArray
  | 0, _, _, _, out => out
  | n + 1, i, acc, nb, out =>
    let acc := acc ||| ((b.get! i).toNat &&& 127) <<< nb
    if nb + 7 ≥ 8 then dec7Go b n (i + 1) (acc >>> 8) (nb - 1) (out.push (acc &&& 255).toUInt8)
    else dec7Go b n (i + 1) acc (nb + 7) out

/-- the payload bytes of a `Bin7` string -/
def dec7 (s : String) : ByteArray :=
  let b := s.toUTF8
  dec7Go b b.size 0 0 0 (ByteArray.emptyWithCapacity (7 * b.size / 8 + 1))

/-- the `u32` at byte `i` -/
@[inline] def u32 (b : ByteArray) (i : Nat) : Nat :=
  (b.get! i).toNat ||| ((b.get! (i + 1)).toNat <<< 8) ||| ((b.get! (i + 2)).toNat <<< 16) ||| ((b.get! (i + 3)).toNat <<< 24)

/-- a job's blocks and witnesses from its payload bytes (`none` if the framing is short) -/
def parseJob (b : ByteArray) : Option (Array ByteArray × Array (Array Nat)) := Id.run do
  if b.size < 4 then return none
  let cnt := u32 b 0
  let mut off := 4
  let mut bs : Array ByteArray := #[]
  let mut ws : Array (Array Nat) := #[]
  for _ in [0:cnt] do
    if off + 4 > b.size then return none
    let nb := u32 b off
    if off + 4 + nb + 4 > b.size then return none
    bs := bs.push (b.extract (off + 4) (off + 4 + nb))
    off := off + 4 + nb
    let nr := u32 b off
    off := off + 4
    if off + 4 * nr > b.size then return none
    ws := ws.push ((Array.range nr).map fun j => u32 b (off + 4 * j))
    off := off + 4 * nr
  return some (bs, ws)

/-! ## Headers, records, glue -/

/-- bits `[0, n)` of the window `[pa, ea)` of `A` equal bits `[0, n)` of the window `[pb, eb)` of `Bb`, 48 at a time -/
def eqBitsGo (A : ByteArray) (pa ea : Nat) (Bb : ByteArray) (pb eb : Nat) : Nat → Nat → Bool
  | 0, _ => true
  | f + 1, n =>
    if n == 0 then true
    else rdE A pa ea (min 48 n) == rdE Bb pb eb (min 48 n) && eqBitsGo A (pa + 48) ea Bb (pb + 48) eb f (n - min 48 n)

@[inline] def eqBits (A : ByteArray) (pa ea : Nat) (Bb : ByteArray) (pb eb n : Nat) : Bool :=
  eqBitsGo A pa ea Bb pb eb (n / 48 + 1) n

/-- the header records of a block: `(bit offset of record 0, count)` -/
@[inline] def hdrOf (D : IPD) (B : ByteArray) : Nat × Nat :=
  let e := 8 * B.size
  let s1 := 6 + D.lb + D.lb * rdE B 1 e 5
  let s2 := if rdE B 0 e 1 == 1 then s1 + 3 * D.nl else s1
  (s2 + 8, rdE B s2 e 8)

/-- the kernel's `glue r Sc` for record `j` of block `P` and the block `Sc`: `Sc` is mode 1 and its `W` bits at bit 1
(`W = 5 + lb + 3 nl + lb d_r`) equal the whole record `r` (`rw` bits): both windows are compared over `max W rw` bits, so
the record's padding above `W` must be zero -/
def glueN (D : IPD) (P : ByteArray) (j : Nat) (Sc : ByteArray) : Bool :=
  let rs := (hdrOf D P).1 + D.rw * j
  let re := rs + D.rw
  let W := 5 + D.lb + 3 * D.nl + D.lb * rdE P rs re 5
  rdE Sc 0 (8 * Sc.size) 1 == 1 && eqBits P rs re Sc 1 (min (8 * Sc.size) (1 + W)) (max W D.rw)

/-- the kernel's `glue0 r Sc` for record `j` of block `P` and the block `Sc`: `Sc` is mode 0 and its bits
`[1, 1 + 5 + lb + lb d_r)` are the record's first bits (both sides truncated to that width) -/
def glue0N (D : IPD) (P : ByteArray) (j : Nat) (Sc : ByteArray) : Bool :=
  let rs := (hdrOf D P).1 + D.rw * j
  let re := rs + D.rw
  rdE Sc 0 (8 * Sc.size) 1 == 0 && eqBits P rs re Sc 1 (8 * Sc.size) (5 + D.lb + D.lb * rdE P rs re 5)

/-- a key (a start header, as a Nat below `2 ^ 1088`) as 136 little-endian bytes -/
def keyBytes (k : Nat) : ByteArray := ⟨Array.ofFn (n := 136) fun j => ((k >>> (8 * j.1)) &&& 255).toUInt8⟩

/-- the header length of a block's start: `6 + lb + lb d` bits in mode 0, plus `3 nl` budget bits in mode 1 -/
def hdrLen (D : IPD) (B : ByteArray) : Nat :=
  let e := 8 * B.size
  6 + D.lb + D.lb * rdE B 1 e 5 + (if rdE B 0 e 1 == 1 then 3 * D.nl else 0)

/-- the block `B` starts with exactly the header `key` (mode 0 or 1): bits `[0, hdrLen)` equal `key`, which has no
other bits -/
def startsWith (D : IPD) (B : ByteArray) (key : Nat) : Bool :=
  let n := hdrLen D B
  key < 2 ^ n && eqBits B 0 (8 * B.size) (keyBytes key) 0 1088 n

/-! ## Jobs -/

/-- block `i` of the chain: accepted, and each header record glued (`glue` or `glue0`) to a later block (witness
`< count`) or to external child `w - count` (by its start key) -/
def blkGlued (D : IPD) (bs : Array ByteArray) (ws : Array (Array Nat)) (ext : Array ByteArray) (i : Nat) : Bool :=
  let B := bs.getD i ByteArray.empty
  let w := ws.getD i #[]
  block D B && w.size == (hdrOf D B).2 &&
    (List.range w.size).all fun j =>
      let t := w.getD j 0
      if t < bs.size then i < t && (glueN D B j (bs.getD t ByteArray.empty) || glue0N D B j (bs.getD t ByteArray.empty))
      else t - bs.size < ext.size &&
        (glueN D B j (ext.getD (t - bs.size) ByteArray.empty) || glue0N D B j (ext.getD (t - bs.size) ByteArray.empty))

/-- a job given as payload bytes: its blocks and witnesses, the first block starts with `key`, every block is accepted
and glued; `ext` are the external children's keys -/
def jobB (D : IPD) (key : Nat) (ext : Array Nat) (b : ByteArray) : Bool :=
  match parseJob b with
  | none => false
  | some (bs, ws) =>
    D.ok && bs.size != 0 && ext.all (· < 2 ^ 1088) && startsWith D (bs.getD 0 ByteArray.empty) key &&
      (List.range bs.size).all (blkGlued D bs ws (ext.map keyBytes))

/-- a job given as a `Bin7` string -/
def jobOK (D : IPD) (key : Nat) (ext : Array Nat) (data : String) : Bool := jobB D key ext (dec7 data)

/-! ## Batches (infra R4): `n` jobs without external children, keys in 192-bit fields of `K` -/

/-- field `i` of `K` (`w` bits) -/
def fld (K w i : Nat) : Nat := K / 2 ^ (w * i) % 2 ^ w

/-- the `n` keys of `K` (192-bit fields), low first, decoded linearly -/
def keysOf (K : Nat) : Nat → Array Nat → Array Nat
  | 0, acc => acc
  | n + 1, acc => keysOf (K >>> 192) n (acc.push (K &&& ((1 <<< 192) - 1)))

/-- jobs `i, i + 1, …` (`n` of them) of a batch payload: per job a `u32` length and its payload bytes -/
def batchGo (D : IPD) (ks : Array Nat) (b : ByteArray) : Nat → Nat → Nat → Bool
  | 0, _, _ => true
  | n + 1, i, off =>
    let len := u32 b off
    off + 4 + len ≤ b.size && jobB D (ks.getD i 0) #[] (b.extract (off + 4) (off + 4 + len)) &&
      batchGo D ks b n (i + 1) (off + 4 + len)

/-- a batch: `n` jobs, keys in `K` (192-bit fields); `s` (`Bin7`) holds per job a `u32` length and its payload -/
def batch (D : IPD) (n K : Nat) (s : String) : Bool := batchGo D (keysOf K n #[]) (dec7 s) n 0 0

end E1N
