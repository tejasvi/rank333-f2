module
public import R22Port.U_d41d8cd98f00
public import L5.t.E159S4_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E159S4
theorem ok0 : S7X.nestChkR (lits.getD 0 0) paths recs 0 34 = true := by decide +kernel
end E159S4
