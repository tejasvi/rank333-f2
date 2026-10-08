module
public import E1N.Check
/-! # E1N.Load: unpacking the per-IP data once per process (core only)

`mkIPD` builds the native IP data from exactly the functions and constants the kernel checker is given:
* `ch c`: chunk `c` of the slot table (64 slots of `sw = 2 nl + 10` bits; the kernel checker's `sl = slc ch`);
* `GP g`: the label permutation of group element `g` (`lb`-bit fields);
* `UB`: the packed label caps (fields of `2 ^ lb` bits).

Every chunk `c < 2 ^ (sib - 6)` is unpacked, so `IPD.cw`/`IPD.sc` agree with `slc ch i` for every slot index `i < 2 ^ sib`,
aliasing of the `#rttablew` dispatcher included.  A chunk becomes its 32-bit words by halving down to 16-word pieces, then 64-bit steps (`toW`, `O(n log n)` bits
moved), never by one shift per slot. -/
@[expose] public section
namespace E1N

/-- `k` 32-bit words of `n` (low first) appended to `acc`, two per 64-bit step (pieces of at most 16 words) -/
def toWSeq (n : Nat) : Nat → Array Nat → Array Nat
  | 0, acc => acc
  | 1, acc => acc.push (n % 2 ^ 32)
  | k + 2, acc =>
    let u := n.toUInt64
    toWSeq (n >>> 64) k ((acc.push (u &&& 0xFFFFFFFF).toNat).push (u >>> 32).toNat)

/-- `k` 32-bit words of `n` (low first) appended to `acc`: halving down to pieces of at most 16 words, then `toWSeq` -/
def toWAcc (n k : Nat) (acc : Array Nat) : Array Nat :=
  if k ≤ 16 then toWSeq n k acc
  else
    let h := k / 2
    toWAcc (n >>> (32 * h)) (k - h) (toWAcc (n &&& ((1 <<< (32 * h)) - 1)) h acc)
termination_by k
decreasing_by all_goals omega

/-- the `k` 32-bit words of `n`, low first -/
def toW (n k : Nat) : Array Nat := toWAcc n k (Array.mkEmpty k)

/-- the 32-bit word at bit `p` of a 32-bit word array, of which only the low `k ≤ 32` bits are kept -/
@[inline] def wbits (w : Array Nat) (p k : Nat) : Nat :=
  (((w.getD (p >>> 5) 0).toUInt64 >>> (p &&& 31).toUInt64 |||
      (w.getD ((p >>> 5) + 1) 0).toUInt64 <<< (32 - (p &&& 31)).toUInt64) &&&
    (((1 : UInt64) <<< k.toUInt64) - 1)).toNat

/-- the 64-slot chunks of a slot table given by 128-slot chunks of 264-bit slots (leaf2's E1 tables, `#rttablew … 128 264`):
chunk `c` is the half `c % 2` of chunk `c / 2` -/
def half (ch : Nat → Nat) (c : Nat) : Nat := (ch (c / 2) >>> (16896 * (c % 2))) &&& ((1 <<< 16896) - 1)

/-- the native IP data (see the module docstring); `leaf` is the leaf check -/
def mkIPD (lb sib satb gb R N UB : Nat) (ch GP : Nat → Nat) (leaf : Array Nat → ByteArray → Nat → Nat → Bool) : IPD :=
  let nl := 2 ^ lb - 1
  let W := 2 ^ lb
  let sw := 2 * nl + 10
  let cwpc := 2 * sw
  let mw := (nl + 31) / 32
  let nch := 2 ^ (sib - 6)
  let ns := 2 ^ sib
  let chW := Array.ofFn (n := nch) fun c => toW (ch c.1) cwpc
  let sm := Array.ofFn (n := ns * mw) fun t =>
    let i := t.1 / mw
    let w := t.1 % mw
    wbits (chW.getD (i >>> 6) #[]) (sw * (i &&& 63) + 32 * w) (min 32 (nl - 32 * w))
  let sc := Array.ofFn (n := ns) fun i => wbits (chW.getD (i.1 >>> 6) #[]) (sw * (i.1 &&& 63) + 2 * nl) 5
  let ub := Array.ofFn (n := nl) fun x => (UB >>> (W * x.1)) &&& ((1 <<< W) - 1)
  let gps := Array.ofFn (n := 2 ^ gb) fun g => GP g.1
  let gp := Array.ofFn (n := 2 ^ gb * nl) fun t => (gps.getD (t.1 / nl) 0 >>> (lb * (t.1 % nl))) &&& ((1 <<< lb) - 1)
  let ok := (List.range nl).all fun x => ub.getD x 0 ≤ 2 ^ 32
  { lb, nl, sib, satb, gb, ns, mw, R, N, ub, sm, sc, gp, leaf, ok }

/-! ## Files (tests): the `#rttablew` chunk semantics on a binary file -/

/-- little-endian bytes `[lo, hi)` of `b` as a Nat (halving) -/
def natLE (b : ByteArray) (lo hi : Nat) : Nat :=
  if h : hi ≤ lo + 8 then
    (List.range (hi - lo)).foldr (fun j a => (b.get! (lo + j)).toNat ||| (a <<< 8)) 0
  else
    let mid := lo + (hi - lo) / 2
    natLE b lo mid ||| (natLE b mid hi <<< (8 * (mid - lo)))
termination_by hi - lo
decreasing_by all_goals omega

/-- chunk `c` of a `#rttablew P "file" cs wb` table held in `b`: the dispatcher reads the low `dep` bits of `c` -/
def chunkOfFile (b : ByteArray) (cs wb : Nat) (c : Nat) : Nat :=
  let wB := wb / 8
  let n := b.size / wB
  let nch := (n + cs - 1) / cs
  let dep := Nat.max 1 (Nat.log2 (nch - 1) + 1)
  let c' := c % 2 ^ dep
  if c' < nch then natLE b (wB * cs * c') (min b.size (wB * cs * (c' + 1))) else 0

/-- entry `i` of a `#rttablew P "file" cs wb` table held in `b` -/
def entryOfFile (b : ByteArray) (cs wb : Nat) (i : Nat) : Nat :=
  (chunkOfFile b cs wb (i / cs) >>> (wb * (i % cs))) &&& ((1 <<< wb) - 1)

/-- the block literals of an `#e1lits` file: `u32` count, then per literal `u32` byte length and the bytes -/
def readLits (b : ByteArray) : Array ByteArray := Id.run do
  let u32 (i : Nat) : Nat := (b.get! i).toNat + 256 * (b.get! (i+1)).toNat + 65536 * (b.get! (i+2)).toNat +
    16777216 * (b.get! (i+3)).toNat
  let cnt := u32 0
  let mut off := 4
  let mut out : Array ByteArray := #[]
  for _ in [0:cnt] do
    let nb := u32 off
    out := out.push (b.extract (off + 4) (off + 4 + nb))
    off := off + 4 + nb
  return out

end E1N
