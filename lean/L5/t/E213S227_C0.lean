module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S227_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E213S227
theorem ok0 : S7X.chunkT (lits.getD 0 0) paths recs 0 15 20 = true := by decide +kernel
end E213S227
