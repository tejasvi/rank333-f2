module
public import R22Port.U_d41d8cd98f00
public import NNP.B321_c1
public import NNP.B321_00
public import NNP.B321_01
public import NNP.B321_02
public import NNP.B321_03
public import NNP.B321_04
public import NNP.B321_05
public import NNP.B321_06
public import NNP.B321_07
public import NNP.B321_08
public import NNP.B321_09
public import NNP.B321_10
public import NNP.B321_11
public import NNP.B321_12
public import NNP.B321_13
public import NNP.B321_14
public import NNP.B321_15
/-! # NNP.Bind321: the `--rord 321` static tables are bound to `L5O.rowE321` (`NNB.T321_<q>`, `NNB.T321_c1`) -/
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
#nnb_all T321 L5O.rowE321 R22D.T321.c2tN 511
namespace NNB

theorem b321 : ∀ q, q < 511 → ∃ rows, R3RT.bindQ L5O.rowE321 q 2 rows (R22D.T321.c2tN.getD q 0) NNB.DC = true :=
  NNB.allBelow_spec NNB.T321_all

theorem b321_c1 : ∃ rows, R3RT.bindQ L5O.rowE321 511 1 rows R22D.T321.CONF1T NNB.DC = true := NNB.T321_c1

end NNB
#print axioms NNB.b321
#print axioms NNB.b321_c1
