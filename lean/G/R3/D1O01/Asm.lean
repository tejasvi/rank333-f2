module
public import R22Port.U_d41d8cd98f00
public import G.Asm
public import G.R3.D1O01.A1
public import G.R3.D1O01.A2_0
public import G.R3.D1O01.A2_1
public import G.R3.D1O01.A2_10
public import G.R3.D1O01.A2_11
public import G.R3.D1O01.A2_12
public import G.R3.D1O01.A2_13
public import G.R3.D1O01.A2_14
public import G.R3.D1O01.A2_2
public import G.R3.D1O01.A2_3
public import G.R3.D1O01.A2_4
public import G.R3.D1O01.A2_5
public import G.R3.D1O01.A2_6
public import G.R3.D1O01.A2_7
public import G.R3.D1O01.A2_8
public import G.R3.D1O01.A2_9
public import G.R3.D1O01.A3_0
public import G.R3.D1O01.A3_1
public import G.R3.D1O01.A3_10
public import G.R3.D1O01.A3_11
public import G.R3.D1O01.A3_12
public import G.R3.D1O01.A3_13
public import G.R3.D1O01.A3_14
public import G.R3.D1O01.A3_15
public import G.R3.D1O01.A3_16
public import G.R3.D1O01.A3_17
public import G.R3.D1O01.A3_18
public import G.R3.D1O01.A3_19
public import G.R3.D1O01.A3_2
public import G.R3.D1O01.A3_20
public import G.R3.D1O01.A3_21
public import G.R3.D1O01.A3_22
public import G.R3.D1O01.A3_23
public import G.R3.D1O01.A3_24
public import G.R3.D1O01.A3_25
public import G.R3.D1O01.A3_26
public import G.R3.D1O01.A3_27
public import G.R3.D1O01.A3_3
public import G.R3.D1O01.A3_4
public import G.R3.D1O01.A3_5
public import G.R3.D1O01.A3_6
public import G.R3.D1O01.A3_7
public import G.R3.D1O01.A3_8
public import G.R3.D1O01.A3_9
public import G.R3.D1O01.S_0_0
public import G.R3.D1O01.S_1_0
public import G.R3.D1O01.S_2_0
public import G.R3.D1O01.S_3_0
public import G.R3.D1O01.S_4_0
public import G.R3.D1O01.S_5_0
public import G.R3.D1O01.S_6_0
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
open G
#asmA R3D1O01 1 1
#asmV R3D1O01 1
theorem R3D1O01.accV : ∃ A : G.Acc.PhaseA 1 (G.Acc.pkState 1 ⟨273, 84, 84, 0, 1⟩) true, G.Acc.VOK1 A.o A.nV3 := ⟨R3D1O01.PA, R3D1O01.VOK⟩
#asmS R3D1O01
theorem R3D1O01.accS : ∃ A : G.Acc.PhaseA 1 (G.Acc.pkState 1 ⟨273, 84, 84, 0, 1⟩) true, G.Acc.SOK A.o A.nRec := ⟨R3D1O01.PA, R3D1O01.SOK⟩
