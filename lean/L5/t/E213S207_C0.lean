module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S207_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E213S207
theorem ok0 : S7X.chunkT (lits.getD 0 0) paths recs 0 5 5 = true := by decide +kernel
end E213S207
