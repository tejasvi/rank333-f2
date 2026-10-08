module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S187_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E218S187
theorem ok2 : S7X.chunkT (lits.getD 0 0) paths recs 10 5 60 = true := by decide +kernel
end E218S187
