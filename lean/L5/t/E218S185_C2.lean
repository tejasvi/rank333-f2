module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S185_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E218S185
theorem ok2 : S7X.chunkT (lits.getD 0 0) paths recs 26 24 54 = true := by decide +kernel
end E218S185
