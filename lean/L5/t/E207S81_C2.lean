module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S81_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E207S81
theorem ok2 : S7X.chunkT (lits.getD 0 0) paths recs 7 5 65 = true := by decide +kernel
end E207S81
