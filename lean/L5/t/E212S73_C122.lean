module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S73_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E212S73
theorem ok122 : S7X.chunkT (lits.getD 0 0) paths recs 4196 64 8465 = true := by decide +kernel
end E212S73
