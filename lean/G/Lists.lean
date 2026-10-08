module
public import R22Port.U_6050cb77ad13
public meta import Lean
public meta import G.Interface
public meta import G.Gram
public import Lean
public import L1.Load
public import G.Interface
public import G.Gram
/-! Constant stride-32 lists over the 512 values of a 3x3 matrix: `XL L` has field `B` = `xvec B L`, `YL R` has field `C` =
`yvec R C` (`L, R < 8`).  Built at elaboration time from the Interface functions, checked by the kernel (`XL_ok`, `YL_ok`). -/
@[expose] public section
open Lean Elab Command L1Load
namespace G.LS
elab "#mklists" : command => do
  for L in [0:8] do
    let mut x := 0
    for B in [0:512] do
      x := x ||| (G.xvec B L <<< (32 * B))
    liftCoreM <| defNat (Name.mkStr (Name.mkStr (Name.mkStr .anonymous "G") "LS") s!"XL{L}") x
  for R in [0:8] do
    let mut y := 0
    for C in [0:512] do
      y := y ||| (G.yvec R C <<< (32 * C))
    liftCoreM <| defNat (Name.mkStr (Name.mkStr (Name.mkStr .anonymous "G") "LS") s!"YL{R}") y
end G.LS
#mklists
namespace G.LS
noncomputable section
def XL (L : Nat) : Nat :=
  cond (Nat.ble L 3) (cond (Nat.ble L 1) (cond (Nat.beq L 0) XL0 XL1) (cond (Nat.beq L 2) XL2 XL3))
    (cond (Nat.ble L 5) (cond (Nat.beq L 4) XL4 XL5) (cond (Nat.beq L 6) XL6 XL7))
def YL (R : Nat) : Nat :=
  cond (Nat.ble R 3) (cond (Nat.ble R 1) (cond (Nat.beq R 0) YL0 YL1) (cond (Nat.beq R 2) YL2 YL3))
    (cond (Nat.ble R 5) (cond (Nat.beq R 4) YL4 YL5) (cond (Nat.beq R 6) YL6 YL7))
def R512 : Nat := G.rep32 512
end
end G.LS
