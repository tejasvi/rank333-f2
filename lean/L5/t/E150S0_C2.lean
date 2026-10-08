module
public import R22Port.U_d41d8cd98f00
public import L5.t.E150S0_Data
public import S7.SplitAsm
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E150S0
theorem ok2 : S7X.subsChk (lits.getD 0 0) paths lits.tail 366 162 = true := by decide +kernel
end E150S0
