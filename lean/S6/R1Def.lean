module
public import R22Port.U_d41d8cd98f00
public import S5.Rec
public import BranchCheck6s
/-! # The rank-1 claims: Nat-level `T(X) u`, `T(X)ᵀ w`, and the table checks behind the exact root records -/
@[expose] public section
namespace S6
open BC4 BC5 BC6 BC6s S5 RootSound Matrix

/-- `T(X) u` as a 9-bit number: `xof` of the column slots (low halves of `txc18 X`) moved into the high halves -/
def mvT (X u : Nat) : Nat := xof (txc18 X <<< 9) u
/-- `T(X)ᵀ w` as a 9-bit number, from the row slots `txr18 X` -/
def mvTt (X w : Nat) : Nat := xof (txr18 X <<< 9) w

/-- the four facts per `(X, v)`: masks `rlm`/`rrm` are exactly the column/row spaces (`xof`/`gof` of the root record
give the preimages), and `kerm`/`lkerm` contain only kernel vectors -/
def root6OK (X v : Nat) : Bool :=
  (!bit (rlm X) v || mvT X (xof (rootP X) v) == v) && (!bit (rrm X) v || mvTt X (gof (rootP X) v) == v) &&
  (!bit (kerm X) v || mvT X v == 0) && (!bit (lkerm X) v || mvTt X v == 0)

def allFrom (lo n : Nat) (f : Nat → Bool) : Bool := allLT n (fun i => f (lo + i))

theorem allFrom_spec {lo n : Nat} {f : Nat → Bool} (h : allFrom lo n f = true) : ∀ i, lo ≤ i → i < lo + n → f i = true := by
  intro i h1 h2
  have := allLT_spec h (i - lo) (by omega)
  rwa [show lo + (i - lo) = i by omega] at this

end S6
