module
public import R22Port.U_d41d8cd98f00
public import L5.t.E202S21_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E202S21
theorem ok8 : S7X.nestChkR (lits.getD 0 0) paths recs 541 136 = true := by decide +kernel
end E202S21
