module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S17_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E218S17
theorem ok1 : S7X.chunkT (lits.getD 0 0) paths recs 1 7 42 = true := by decide +kernel
end E218S17
