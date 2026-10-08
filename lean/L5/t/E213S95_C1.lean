module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S95_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E213S95
theorem ok1 : S7X.chunkT (lits.getD 0 0) paths recs 32 8 98 = true := by decide +kernel
end E213S95
