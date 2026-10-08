module
public import R22Port.U_d41d8cd98f00
public import S5.Base
/-! # The root records are the elimination of `T(X)`, checked by the kernel -/
@[expose] public section
namespace S5
open BC4 BC5

def rootOK (X : Nat) : Bool :=
  let s := elim (Nat.xor (txc18 X) ID18)
  Nat.beq (Nat.land (rpt X) M162) s.P && Nat.beq (Nat.land (Nat.shiftRight (rpt X) 162) 511) s.PM &&
  Nat.beq (rlm X) (lmC s.P s.PM) && Nat.beq (rrm X) (kerM s.M) &&
  Nat.beq (Nat.land (Nat.shiftRight RKT (Nat.mul 4 X)) 15) s.rk && elimOk s

theorem root_fact : allLT 512 rootOK = true := by decide +kernel

end S5
