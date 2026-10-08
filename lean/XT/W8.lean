module
/-! # XT.W8: 512-bit label masks as eight unboxed 64-bit words (core only)

A `W8` is one heap object with eight scalar fields, so a row costs one allocation and a row operation touches one cache line pair.
Bit `l` of the mask is bit `l % 64` of word `l / 64` (the layout of `NN.natL`); `view` is the Nat.

* `pc64`: popcount by Kernighan's loop (`popK`; LLVM turns the idiom into `popcnt`);
* `andPop x y = |x ∧ y|` without building `x ∧ y`;
* `lowIdx x`: the index of the lowest set bit of a nonzero word, `pc64 (b - 1)` for the isolated bit `b`. -/
@[expose] public section

namespace XT

theorem andPred_lt (x : UInt64) (h : ¬ x = 0) : (x &&& (x - 1)).toNat < x.toNat := by
  have h1 : 1 ≤ x.toNat := by
    have : x.toNat ≠ 0 := by
      intro h0; apply h; exact UInt64.toNat_inj.mp (by simpa using h0)
    omega
  have h2 : (x - 1).toNat = x.toNat - 1 := by
    rw [UInt64.toNat_sub_of_le]; · rfl
    · rw [UInt64.le_iff_toNat_le]; simpa using h1
  rw [UInt64.toNat_and, h2]
  have := Nat.and_le_right (n := x.toNat) (m := x.toNat - 1)
  omega

/-- popcount by clearing the lowest set bit (Kernighan): `c + |x|`; LLVM turns the loop into `popcnt` -/
def popK (x c : UInt64) : UInt64 :=
  if h : x = 0 then c else popK (x &&& (x - 1)) (c + 1)
termination_by x.toNat
decreasing_by exact andPred_lt x h

/-- popcount of a word -/
@[inline] def pc64 (x : UInt64) : UInt64 := popK x 0

/-- the index of the lowest set bit (for `x ≠ 0`): the popcount of the bits below it (not inlined: its `popcnt` stays in this
module's C, where LLVM inlines `popK`) -/
@[noinline] def lowIdx (x : UInt64) : UInt64 := pc64 ((x ^^^ (x &&& (x - (1 : UInt64)))) - (1 : UInt64))

structure W8 where
  a0 : UInt64
  a1 : UInt64
  a2 : UInt64
  a3 : UInt64
  a4 : UInt64
  a5 : UInt64
  a6 : UInt64
  a7 : UInt64
  deriving Inhabited

namespace W8

def zero : W8 := ⟨0, 0, 0, 0, 0, 0, 0, 0⟩

/-- the Nat of the mask -/
def view (x : W8) : Nat :=
  x.a0.toNat + 2 ^ 64 * (x.a1.toNat + 2 ^ 64 * (x.a2.toNat + 2 ^ 64 * (x.a3.toNat + 2 ^ 64 * (x.a4.toNat +
    2 ^ 64 * (x.a5.toNat + 2 ^ 64 * (x.a6.toNat + 2 ^ 64 * (x.a7.toNat + 2 ^ 64 * 0)))))))

@[inline] def and (x y : W8) : W8 :=
  ⟨x.a0 &&& y.a0, x.a1 &&& y.a1, x.a2 &&& y.a2, x.a3 &&& y.a3, x.a4 &&& y.a4, x.a5 &&& y.a5, x.a6 &&& y.a6, x.a7 &&& y.a7⟩
@[inline] def or (x y : W8) : W8 :=
  ⟨x.a0 ||| y.a0, x.a1 ||| y.a1, x.a2 ||| y.a2, x.a3 ||| y.a3, x.a4 ||| y.a4, x.a5 ||| y.a5, x.a6 ||| y.a6, x.a7 ||| y.a7⟩
/-- `x ∧ ¬y` -/
@[inline] def andn (x y : W8) : W8 :=
  ⟨x.a0 &&& ~~~y.a0, x.a1 &&& ~~~y.a1, x.a2 &&& ~~~y.a2, x.a3 &&& ~~~y.a3, x.a4 &&& ~~~y.a4, x.a5 &&& ~~~y.a5,
   x.a6 &&& ~~~y.a6, x.a7 &&& ~~~y.a7⟩
@[inline] def beq (x y : W8) : Bool :=
  x.a0 == y.a0 && x.a1 == y.a1 && x.a2 == y.a2 && x.a3 == y.a3 && x.a4 == y.a4 && x.a5 == y.a5 && x.a6 == y.a6 && x.a7 == y.a7
@[inline] def isZero (x : W8) : Bool := (x.a0 ||| x.a1 ||| x.a2 ||| x.a3 ||| x.a4 ||| x.a5 ||| x.a6 ||| x.a7) == 0

/-- popcount (at most 512, no overflow); not inlined, like `andPop`: LLVM inlines `popK` here (eight `popcnt`s, one call) -/
@[noinline] def pop (x : W8) : Nat :=
  (pc64 x.a0 + pc64 x.a1 + pc64 x.a2 + pc64 x.a3 + pc64 x.a4 + pc64 x.a5 + pc64 x.a6 + pc64 x.a7).toNat
/-- `|x ∧ y|` (not inlined: one call with eight `popcnt`s instead of eight calls across C files) -/
@[noinline] def andPop (x y : W8) : Nat :=
  (pc64 (x.a0 &&& y.a0) + pc64 (x.a1 &&& y.a1) + pc64 (x.a2 &&& y.a2) + pc64 (x.a3 &&& y.a3) + pc64 (x.a4 &&& y.a4) +
   pc64 (x.a5 &&& y.a5) + pc64 (x.a6 &&& y.a6) + pc64 (x.a7 &&& y.a7)).toNat

/-- word `i` (0 past the end) (for the proofs) -/
def limb (x : W8) (i : Nat) : UInt64 :=
  match i with
  | 0 => x.a0 | 1 => x.a1 | 2 => x.a2 | 3 => x.a3 | 4 => x.a4 | 5 => x.a5 | 6 => x.a6 | 7 => x.a7 | _ => 0

/-- the eight words as an array (for the proofs) -/
def arr (x : W8) : Array UInt64 := #[x.a0, x.a1, x.a2, x.a3, x.a4, x.a5, x.a6, x.a7]

/-- word `i` (0 past the end), by word index as `UInt64` (compiled to scalar compares) -/
@[inline] def limbU (x : W8) (i : UInt64) : UInt64 :=
  if i < 4 then (if i < 2 then (if i = 0 then x.a0 else x.a1) else (if i = 2 then x.a2 else x.a3))
  else if i < 8 then (if i < 6 then (if i = 4 then x.a4 else x.a5) else (if i = 6 then x.a6 else x.a7)) else 0
/-- replace word `i` (no-op past 7) -/
@[inline] def setLimbU (x : W8) (i : UInt64) (v : UInt64) : W8 :=
  if i < 4 then (if i < 2 then (if i = 0 then { x with a0 := v } else { x with a1 := v })
                 else (if i = 2 then { x with a2 := v } else { x with a3 := v }))
  else if i < 8 then (if i < 6 then (if i = 4 then { x with a4 := v } else { x with a5 := v })
                      else (if i = 6 then { x with a6 := v } else { x with a7 := v })) else x

/-- bit `l` (false from 512 on) -/
@[inline] def testBit (x : W8) (l : Nat) : Bool :=
  if l < 512 then ((x.limbU (l.toUInt64 >>> 6)) >>> (l.toUInt64 &&& 63)) &&& 1 != 0 else false
/-- set bit `l` (no-op from 512 on) -/
@[inline] def setBit (x : W8) (l : Nat) : W8 :=
  if l < 512 then x.setLimbU (l.toUInt64 >>> 6) (x.limbU (l.toUInt64 >>> 6) ||| ((1 : UInt64) <<< (l.toUInt64 &&& 63))) else x
/-- clear bit `l` (no-op from 512 on) -/
@[inline] def clrBit (x : W8) (l : Nat) : W8 :=
  if l < 512 then x.setLimbU (l.toUInt64 >>> 6) (x.limbU (l.toUInt64 >>> 6) &&& ~~~((1 : UInt64) <<< (l.toUInt64 &&& 63))) else x

/-- the mask of word `j` that clears bit `b` when `i = j` (all ones otherwise) -/
@[inline] def clrMask (i b j : UInt64) : UInt64 := if i = j then ~~~((1 : UInt64) <<< b) else ~~~0

/-- `(w ∪ m) \ {l}` in one construction (`= (w.or m).clrBit l`, `XTP.W8.orClr_eq`) -/
@[inline] def orClr (w m : W8) (l : Nat) : W8 :=
  if l < 512 then
    ⟨(w.a0 ||| m.a0) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 0,
     (w.a1 ||| m.a1) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 1,
     (w.a2 ||| m.a2) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 2,
     (w.a3 ||| m.a3) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 3,
     (w.a4 ||| m.a4) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 4,
     (w.a5 ||| m.a5) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 5,
     (w.a6 ||| m.a6) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 6,
     (w.a7 ||| m.a7) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 7⟩
  else w.or m

/-- `(w ∪ (c \ {x})) \ {l}` in one construction (`= (w.or (c.clrBit x)).clrBit l`, `XTP.W8.orClr2_eq`) -/
@[inline] def orClr2 (w c : W8) (x l : Nat) : W8 :=
  if x < 512 && l < 512 then
    ⟨(w.a0 ||| (c.a0 &&& clrMask (x.toUInt64 >>> 6) (x.toUInt64 &&& 63) 0)) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 0,
     (w.a1 ||| (c.a1 &&& clrMask (x.toUInt64 >>> 6) (x.toUInt64 &&& 63) 1)) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 1,
     (w.a2 ||| (c.a2 &&& clrMask (x.toUInt64 >>> 6) (x.toUInt64 &&& 63) 2)) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 2,
     (w.a3 ||| (c.a3 &&& clrMask (x.toUInt64 >>> 6) (x.toUInt64 &&& 63) 3)) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 3,
     (w.a4 ||| (c.a4 &&& clrMask (x.toUInt64 >>> 6) (x.toUInt64 &&& 63) 4)) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 4,
     (w.a5 ||| (c.a5 &&& clrMask (x.toUInt64 >>> 6) (x.toUInt64 &&& 63) 5)) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 5,
     (w.a6 ||| (c.a6 &&& clrMask (x.toUInt64 >>> 6) (x.toUInt64 &&& 63) 6)) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 6,
     (w.a7 ||| (c.a7 &&& clrMask (x.toUInt64 >>> 6) (x.toUInt64 &&& 63) 7)) &&& clrMask (l.toUInt64 >>> 6) (l.toUInt64 &&& 63) 7⟩
  else (w.or (c.clrBit x)).clrBit l

/-- eight limbs from `off` (`get!`: zero past the end) -/
@[inline] def ofLimbs (a : Array UInt64) (off : Nat) : W8 :=
  ⟨a[off]!, a[off + 1]!, a[off + 2]!, a[off + 3]!, a[off + 4]!, a[off + 5]!, a[off + 6]!, a[off + 7]!⟩

/-- `M511`: the labels `0 .. 510` -/
def all511 : W8 :=
  ⟨0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF,
   0xFFFFFFFFFFFFFFFF, 0x7FFFFFFFFFFFFFFF⟩

/-- a Nat below `2 ^ 512` as a mask (static tables, built once) -/
def ofNat (n : Nat) : W8 :=
  ⟨n.toUInt64, (n >>> 64).toUInt64, (n >>> 128).toUInt64, (n >>> 192).toUInt64, (n >>> 256).toUInt64,
   (n >>> 320).toUInt64, (n >>> 384).toUInt64, (n >>> 448).toUInt64⟩

end W8

/-- the labels `u+1 .. 510`, for `u < 511` (built once) -/
def windowTab : Array W8 := (Array.range 511).map fun u => W8.ofNat (2 ^ 511 - 2 ^ (u + 1))

end XT
