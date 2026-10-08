module
public import R22Port.U_d41d8cd98f00
public import L5.t.E390S1_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E390S1
theorem ok0 : S7X.chunkT (lits.getD 0 0) paths recs 0 64 197 = true := by decide +kernel
end E390S1
