module

/-! # NN.Core: core-only basics of the native main-search node checker (native track, 2026-10-07)

Everything here imports only `Init`, so the module set can be compiled with `lean -c` and `leanc -DLEAN_EXPORTING -shared`.
All functions are total (no `partial`, no `implemented_by`): the refinement proofs (`NNP.*`) unfold them.

Representations (shared with the X tier, `native/xtier`):
* a **limb array** `a : Array UInt64` holds the Nat `natL a off len = ∑_{k<len} a[off+k]!.toNat * 2^(64k)`;
  a 511-bit label mask is 8 limbs (bit `l` = bit `l % 64` of limb `l / 64`);
* the conflict table `N` is 4096 limbs (slot `v` = limbs `[8v, 8v+8)`, the Nat's bits `[512v, 512v+512)`);
* the counters `U` are a `ByteArray` of 512 fields (`U[X]` = 7-bit field `X` of the packed Nat, view `natU`);
* items of a batch file: `[u64 len][len bytes LE]`. -/
@[expose] public section

namespace NN

/-! ## Views (used by the proofs; also executable) -/

/-- the Nat of limbs `[off, off+len)` -/
def natL (a : Array UInt64) (off : Nat) : Nat → Nat
  | 0 => 0
  | n + 1 => a[off]!.toNat + 2 ^ 64 * natL a (off + 1) n

/-- row `p` of a row array (8 limbs per row), 0 past the end -/
def rowV (a : Array UInt64) (p : Nat) : Nat := if 8 * p + 8 ≤ a.size then natL a (8 * p) 8 else 0

/-- the packed 7-bit counters of an unpacked counter array (fields `0 ..< n`) -/
def natU7 (U : ByteArray) : Nat → Nat
  | 0 => 0
  | n + 1 => natU7 U n + (U.get! n).toNat * 2 ^ (7 * n)

/-- the 512 counters -/
def natU (U : ByteArray) : Nat := natU7 U 512

/-- little-endian bytes `[o, o+n)` as a Nat -/
def natB (b : ByteArray) (o : Nat) : Nat → Nat
  | 0 => 0
  | n + 1 => (b.get! o).toNat + 256 * natB b (o + 1) n

/-! ## Reading bytes -/

/-- 8 bytes little-endian at `o`; bytes past the end read as 0 -/
def rdU64 (b : ByteArray) (o : Nat) : UInt64 :=
  (b.get! o).toUInt64 ||| (b.get! (o+1)).toUInt64 <<< 8 ||| (b.get! (o+2)).toUInt64 <<< 16 |||
  (b.get! (o+3)).toUInt64 <<< 24 ||| (b.get! (o+4)).toUInt64 <<< 32 ||| (b.get! (o+5)).toUInt64 <<< 40 |||
  (b.get! (o+6)).toUInt64 <<< 48 ||| (b.get! (o+7)).toUInt64 <<< 56

/-- the low `n` bytes of a word (`n ≤ 8`) -/
def lowBytes (x : UInt64) (n : Nat) : UInt64 :=
  if n ≥ 8 then x else x &&& (((1 : UInt64) <<< (8 * n).toUInt64) - 1)

/-- limbs of the little-endian bytes `[o, o+n)`: `(n+7)/8` words, the last one masked -/
def limbsB (b : ByteArray) (o n : Nat) : Array UInt64 :=
  (Array.range ((n + 7) / 8)).map fun k => lowBytes (rdU64 b (o + 8 * k)) (n - 8 * k)

/-- `limbsB` padded with zero words to exactly `w` words (the item must have at most `8 w` bytes) -/
def limbsBW (b : ByteArray) (o n w : Nat) : Array UInt64 :=
  (Array.range w).map fun k => if 8 * k < n then lowBytes (rdU64 b (o + 8 * k)) (n - 8 * k) else 0

/-! ## Items -/

/-- the item at byte offset `o`: payload offset, payload length, next offset (`none` if it does not fit) -/
def item (b : ByteArray) (o : Nat) : Option (Nat × Nat × Nat) :=
  if o + 8 ≤ b.size then
    let n := (rdU64 b o).toNat
    if o + 8 + n ≤ b.size then some (o + 8, n, o + 8 + n) else none
  else none

/-- a small item (at most 8 bytes) as a Nat, and the next offset -/
def itemN (b : ByteArray) (o : Nat) : Option (Nat × Nat) :=
  match item b o with
  | some (p, n, o') => if n ≤ 8 then some ((lowBytes (rdU64 b p) n).toNat, o') else none
  | none => none

/-- `k` small items as an array, and the next offset -/
def itemsN (b : ByteArray) : Nat → Nat → Array Nat → Option (Array Nat × Nat)
  | 0, o, acc => some (acc, o)
  | k + 1, o, acc =>
    match itemN b o with
    | some (v, o') => itemsN b k o' (acc.push v)
    | none => none

/-- a counted list of small items: count, then the items -/
def itemList (b : ByteArray) (o : Nat) : Option (Array Nat × Nat) :=
  match itemN b o with
  | some (k, o') => itemsN b k o' (Array.mkEmpty k)
  | none => none

/-! ## Words -/

/-- popcount of a byte (table) -/
def popTab : ByteArray := ⟨#[0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,
  2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,
  3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,
  3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,
  4,5,5,6,5,6,6,7,5,6,6,7,6,7,7,8]⟩

/-- popcount of a word -/
def pop64 (x : UInt64) : Nat :=
  if x == 0 then 0 else
  (popTab.get! (x &&& 255).toNat).toNat + (popTab.get! ((x >>> 8) &&& 255).toNat).toNat +
  (popTab.get! ((x >>> 16) &&& 255).toNat).toNat + (popTab.get! ((x >>> 24) &&& 255).toNat).toNat +
  (popTab.get! ((x >>> 32) &&& 255).toNat).toNat + (popTab.get! ((x >>> 40) &&& 255).toNat).toNat +
  (popTab.get! ((x >>> 48) &&& 255).toNat).toNat + (popTab.get! ((x >>> 56) &&& 255).toNat).toNat

/-- popcount of limbs `[off, off+n)` -/
def popL (a : Array UInt64) (off : Nat) : Nat → Nat
  | 0 => 0
  | n + 1 => pop64 (a.getD off 0) + popL a (off + 1) n

/-- bit `i` of the Nat of limbs from `off` -/
def bitL (a : Array UInt64) (off i : Nat) : Bool := (a.getD (off + i / 64) 0 >>> (i % 64).toUInt64) &&& 1 == 1

/-- the bits `[s, s+w)` (`w ≤ 64`) of the Nat of limbs from `off` -/
def fieldL (a : Array UInt64) (off s w : Nat) : Nat :=
  let q := s / 64
  let r := s % 64
  let lo := a.getD (off + q) 0 >>> r.toUInt64
  let hi := if r = 0 then 0 else a.getD (off + q + 1) 0 <<< (64 - r).toUInt64
  let msk : UInt64 := if w ≥ 64 then 0xFFFFFFFFFFFFFFFF else ((1 : UInt64) <<< w.toUInt64) - 1
  ((lo ||| hi) &&& msk).toNat

/-! ## Loops (tail-recursive, specialized at call sites) -/

/-- `∀ i < n, f i` -/
@[specialize] def allN (f : Nat → Bool) (n : Nat) : Bool := go 0
where
  go (i : Nat) : Bool := if i < n then (if f i then go (i + 1) else false) else true
  termination_by n - i

/-- `f 0 ||| … ||| f (n-1)` -/
@[specialize] def orN (f : Nat → UInt64) (n : Nat) : UInt64 := go 0 0
where
  go (i : Nat) (acc : UInt64) : UInt64 := if i < n then go (i + 1) (acc ||| f i) else acc
  termination_by n - i

/-- `f 0 + … + f (n-1)` -/
@[specialize] def sumN (f : Nat → Nat) (n : Nat) : Nat := go 0 0
where
  go (i : Nat) (acc : Nat) : Nat := if i < n then go (i + 1) (acc + f i) else acc
  termination_by n - i

/-- `f a + … + f (n-1)` -/
@[specialize] def sumFrom (f : Nat → Nat) (a n : Nat) : Nat := go a 0
where
  go (i : Nat) (acc : Nat) : Nat := if i < n then go (i + 1) (acc + f i) else acc
  termination_by n - i

end NN
