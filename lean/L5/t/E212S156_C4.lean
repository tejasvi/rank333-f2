module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S156_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E212S156
theorem ok4 : S7X.chunkT (lits.getD 0 0) paths recs 28 9 37 = true := by decide +kernel
end E212S156
