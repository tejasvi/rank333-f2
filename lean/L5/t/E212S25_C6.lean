module
public import R22Port.U_d41d8cd98f00
public import L5.t.E212S25_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E212S25
theorem ok6 : S7X.chunkT (lits.getD 0 0) paths recs 23 6 29 = true := by decide +kernel
end E212S25
