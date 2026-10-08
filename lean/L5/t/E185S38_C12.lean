module
public import R22Port.U_d41d8cd98f00
public import L5.t.E185S38_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E185S38
theorem ok12 : S7X.nestChkR (lits.getD 0 0) paths recs 577 122 = true := by decide +kernel
end E185S38
