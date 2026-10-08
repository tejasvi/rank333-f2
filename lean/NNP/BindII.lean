module
public import R22Port.U_d41d8cd98f00
public import NNP.BII_c1
public import NNP.BII_00
public import NNP.BII_01
public import NNP.BII_02
public import NNP.BII_03
public import NNP.BII_04
public import NNP.BII_05
public import NNP.BII_06
public import NNP.BII_07
public import NNP.BII_08
public import NNP.BII_09
public import NNP.BII_10
public import NNP.BII_11
public import NNP.BII_12
public import NNP.BII_13
public import NNP.BII_14
public import NNP.BII_15
/-! # NNP.BindII: case (II)'s static tables are bound to `L5II.rowEII` (511 cap-2 checks `NNB.II_<q>`, the cap-1 check `NNB.II_c1`) -/
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
#nnb_all II L5II.rowEII R22D.c2tN 511
namespace NNB

theorem bII : ∀ q, q < 511 → ∃ rows, R3RT.bindQ L5II.rowEII q 2 rows (R22D.c2tN.getD q 0) NNB.DC = true :=
  NNB.allBelow_spec NNB.II_all

theorem bII_c1 : ∃ rows, R3RT.bindQ L5II.rowEII 511 1 rows NN.CONF1II NNB.DC = true := NNB.II_c1

end NNB
#print axioms NNB.bII
#print axioms NNB.bII_c1
