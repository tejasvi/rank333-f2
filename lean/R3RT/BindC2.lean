module
public import R22Port.U_d41d8cd98f00
public import R3RT.Rows3eD
/-! # Binding L1's static tables to RT's verified kept rows

`bindQ rowE q cap rows stored DC = true` (labels `< 511` only, so label bits cannot absorb cap bits) for table `q` (`stored` = `L1.T.c2t_q`, cap 2; or `q = 511` and `stored` = `L1.T.CONF1T`,
cap 1): every listed row `(id, labels)` is RT's entry `id` with exactly these labels and this cap (`rowE id = mask ||| cap <<< 511`)
and, for `q < 511`, holds `q`; the table derived from them, slot `u` = OR of the listed rows through `u` (`u ≠ q`), with the bits
of `DC` kept (`DC` clears the diagonal), equals `stored`.  So every bit `(u, w)` of a stored table lies in a valid kept row of that
cap through `q`, `u` and `w` (cap 1: through `u` and `w`).  Any `DC` is sound: it only removes bits of the derived table. -/
@[expose] public section
noncomputable section
namespace R3RT
def ptsMask : List Nat → Nat :=
  List.rec (motive := fun _ => Nat) 0 (fun l _ ih => Nat.lor (Nat.shiftLeft 1 l) ih)
def slotsOr (m q : Nat) : List Nat → Nat → Nat :=
  List.rec (motive := fun _ => Nat → Nat) (fun T => T)
    (fun u _ ih T => ih (Bool.rec (Nat.lor T (Nat.shiftLeft m (Nat.mul 512 u))) T (Nat.beq u q)))
def rowsFold (rowE : Nat → Nat) (q cap : Nat) : List (Nat × List Nat) → Nat → (Nat → Bool) → Bool :=
  List.rec (motive := fun _ => Nat → (Nat → Bool) → Bool) (fun T k => k T)
    (fun r _ ih T k =>
      let m := ptsMask r.2
      Nat.beq (Nat.shiftRight m 511) 0 && Nat.beq (rowE r.1) (Nat.lor m (Nat.shiftLeft cap 511)) &&
      (Nat.beq q 511 || Nat.beq (Nat.land (Nat.shiftRight m q) 1) 1) &&
      ih (slotsOr m q r.2 T) k)
def bindQ (rowE : Nat → Nat) (q cap : Nat) (rows : List (Nat × List Nat)) (stored DC : Nat) : Bool :=
  rowsFold rowE q cap rows 0 (fun T => Nat.beq (Nat.land T DC) stored)
end R3RT
end
