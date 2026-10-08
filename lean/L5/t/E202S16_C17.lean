module
public import R22Port.U_d41d8cd98f00
public import L5.t.E202S16_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E202S16
theorem ok17 : S7X.nestChkR (lits.getD 0 0) paths recs 521 90 = true := by decide +kernel
end E202S16
