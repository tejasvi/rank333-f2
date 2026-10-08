module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S142_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E218S142
theorem ok6 : S7X.chunkT (lits.getD 0 0) paths recs 25 38 63 = true := by decide +kernel
end E218S142
