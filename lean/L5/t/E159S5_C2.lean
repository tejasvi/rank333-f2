module
public import R22Port.U_d41d8cd98f00
public import L5.t.E159S5_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E159S5
theorem ok2 : S7X.nestChkR (lits.getD 0 0) paths recs 28 7 = true := by decide +kernel
end E159S5
