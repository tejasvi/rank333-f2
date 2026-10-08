module
public import NL.Check
public import E1N.Check
/-! # E1N.Leaf: the E1-family leaf hooks (core only)

* `leafHook VT DOM` (E1P): the leaf agent's native v7 leaf checker `NL.leafCertW` (native/leaf/NL/Check.lean) applied to the
  first factors `(VT >>> 9 x) &&& 511` of the prefix labels `x`, the domain `M8.ofNat DOM` and the certificate window `[q, e)`
  of the block bytes.  The leaf agent's `NL.e1p_leaf` (NLP/E1Hook.lean) turns an accepted call into
  `BC7.leafS (E1P.leafRec R VT DOM (packL 8 labs) (win (natOfBytes B) e q)) = true` (refinement: `R/Leaf.lean`).
* `leafHookG VT DOM EXT` (E1G, the kernel's `E1G.leafOK`): an all-zero certificate window means an external leaf, accepted iff
  the prefix (7-bit labels, packed) is in `EXT`; otherwise the v7 leaf check as above (`NL.e1g_leaf`). -/
@[expose] public section
namespace E1N

/-- the leaf check of a prefix `labs` whose certificate is the window `[q, e)` of `B` -/
def leafHook (VT DOM : Nat) (labs : Array Nat) (B : ByteArray) (q e : Nat) : Bool :=
  NL.leafCertW (labs.map fun x => Nat.land (Nat.shiftRight VT (Nat.mul 9 x)) 511) (NL.M8.ofNat DOM) B q e

/-- `f` 48-bit pieces of the window `[q, e)` from `q` are zero -/
def winZeroGo (B : ByteArray) (e : Nat) : Nat → Nat → Bool
  | 0, _ => true
  | f + 1, q => rdE B q e 48 == 0 && winZeroGo B e f (q + 48)

/-- the window `[q, e)` of `B` is zero -/
def winZero (B : ByteArray) (q e : Nat) : Bool := winZeroGo B e ((e - q) / 48 + 1) q

/-- labels packed `lb` bits each, the first at the low end -/
def packN (lb : Nat) (labs : Array Nat) : Nat := labs.foldr (fun x a => x + 2 ^ lb * a) 0

/-- the E1G leaf check (`E1G.leafOK`): an external leaf (zero certificate, prefix in `EXT`) or a v7 leaf -/
def leafHookG (VT DOM : Nat) (EXT : List Nat) (labs : Array Nat) (B : ByteArray) (q e : Nat) : Bool :=
  if winZero B q e then EXT.contains (packN 7 labs) else leafHook VT DOM labs B q e

end E1N
