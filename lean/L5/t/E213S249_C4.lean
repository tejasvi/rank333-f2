module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S249_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E213S249
theorem ok4 : S7X.chunkT (lits.getD 0 0) paths recs 24 5 68 = true := by decide +kernel
end E213S249
