module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S56_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E218S56
theorem ok7 : S7X.chunkT (lits.getD 0 0) paths recs 64 3 1467 = true := by decide +kernel
end E218S56
