module
public import R22Port.U_d41d8cd98f00
public import L5.t.E185S31_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E185S31
theorem ok1 : S7X.nestChkR (lits.getD 0 0) paths recs 59 23 = true := by decide +kernel
end E185S31
