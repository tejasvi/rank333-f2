module
public import R22Port.U_d41d8cd98f00
public import L5.t.E150S1_Data
public import S7.SplitAsm
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E150S1
theorem ok1 : S7X.subsChk (lits.getD 0 0) paths lits.tail 135 221 = true := by decide +kernel
end E150S1
