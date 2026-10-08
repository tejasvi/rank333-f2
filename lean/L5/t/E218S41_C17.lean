module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S41_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E218S41
theorem ok17 : S7X.chunkT (lits.getD 0 0) paths recs 336 20 356 = true := by decide +kernel
end E218S41
