module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S27_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E212S27
theorem ok17 : S7X.chunkT (lits.getD 0 0) paths recs 436 40 919 = true := by decide +kernel
end E212S27
