module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S204_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E236S204
theorem ok2 : S7X.chunkT (lits.getD 0 0) paths recs 3 3 31 = true := by decide +kernel
end E236S204
