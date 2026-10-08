module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S53_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E207S53
theorem ok3 : S7X.chunkT (lits.getD 0 0) paths recs 18 6 24 = true := by decide +kernel
end E207S53
