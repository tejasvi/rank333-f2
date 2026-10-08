module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S195_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E218S195
theorem ok3 : S7X.chunkT (lits.getD 0 0) paths recs 11 12 23 = true := by decide +kernel
end E218S195
