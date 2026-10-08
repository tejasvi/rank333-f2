module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S101_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E218S101
theorem ok3 : S7X.chunkT (lits.getD 0 0) paths recs 57 42 125 = true := by decide +kernel
end E218S101
