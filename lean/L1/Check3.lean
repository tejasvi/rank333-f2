module
public import R22Port.U_d41d8cd98f00
public import L1.Check2
public import L1.HypConsts
/-! # L1 node checker v3 = v2 + the packed hyperplane counters (r22/lean/DESIGN.md section 20)

The state also carries `U` = the 512 hyperplane hit counts in 7-bit fields (`L1/HypBridge.lean`).  Per node: `U' = U + h`
(`h` = hit vector of the last label) and two packed tests for every functional `X` at once:
`hits X + rem ≥ need X` (`rem` = points still to choose) and `hits X + min(suf X, 40) ≥ need X` (`suf` = labels above
the last one that hit `X`): prof7's deficit condition, `need - hits ≤ min(rem, suf)`. -/
@[expose] public section
noncomputable section
namespace L1

def node3 (S D N U dP c2 h suf rec : Nat) (ks : List Nat) (k : Nat → Nat → Nat → Nat → Bool) : Bool :=
  let d := Nat.land (Nat.shiftRight rec 17) 31
  let U' := Nat.add U h
  Nat.beq (Nat.land (Nat.add (Nat.add U' (Nat.mul (Nat.sub 22 d) ONES7)) OFFN7) G7) G7 &&
  Nat.beq (Nat.land (Nat.add (Nat.add U' suf) OFFN7) G7) G7 &&
  node2 S D N dP c2 rec ks (fun S' D' N' => k S' D' N' U')

/-- a batch: stack of `(S, D, N, U, d)` (deepest first), nodes `(c2, h, suf, rec, kills)` -/
def batch3 : List (Nat × Nat × Nat × Nat × Nat) → List (Nat × Nat × Nat × Nat × List Nat) → Bool
  | _, [] => true
  | st, (c2, h, suf, rec, ks) :: rest =>
    match List.drop (Nat.land rec 255) st with
    | [] => false
    | (S, D, N, U, dP) :: st' =>
      node3 S D N U dP c2 h suf rec ks
        (fun S' D' N' U' => batch3 ((S', D', N', U', Nat.succ dP) :: (S, D, N, U, dP) :: st') rest)

end L1
end
