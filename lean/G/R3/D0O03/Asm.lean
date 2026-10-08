module
public import R22Port.U_d41d8cd98f00
public import G.Asm
public import G.R3.D0O03.A1
public import G.R3.D0O03.A2_0
public import G.R3.D0O03.A2_1
public import G.R3.D0O03.A2_10
public import G.R3.D0O03.A2_11
public import G.R3.D0O03.A2_12
public import G.R3.D0O03.A2_13
public import G.R3.D0O03.A2_14
public import G.R3.D0O03.A2_2
public import G.R3.D0O03.A2_3
public import G.R3.D0O03.A2_4
public import G.R3.D0O03.A2_5
public import G.R3.D0O03.A2_6
public import G.R3.D0O03.A2_7
public import G.R3.D0O03.A2_8
public import G.R3.D0O03.A2_9
public import G.R3.D0O03.S_0_0
public import G.R3.D0O03.S_1_0
public import G.R3.D0O03.S_2_0
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
open G
#asmA R3D0O03 0 0
#asmS R3D0O03
theorem R3D0O03.accS : ∃ A : G.Acc.PhaseA 0 (G.Acc.pkState 0 ⟨17, 84, 84, 0, 0⟩) false, G.Acc.SOK A.o A.nRec := ⟨R3D0O03.PA, R3D0O03.SOK⟩
