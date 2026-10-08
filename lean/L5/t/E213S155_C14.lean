module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S155_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E213S155
theorem ok14 : S7X.chunkT (lits.getD 0 0) paths recs 449 22 958 = true := by decide +kernel
end E213S155
