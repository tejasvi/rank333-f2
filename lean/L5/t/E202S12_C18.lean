module
public import R22Port.U_d41d8cd98f00
public import L5.t.E202S12_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E202S12
theorem ok18 : S7X.nestChkR (lits.getD 0 0) paths recs 632 96 = true := by decide +kernel
end E202S12
