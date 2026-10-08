module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S161_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E218S161
theorem ok8 : S7X.chunkT (lits.getD 0 0) paths recs 46 14 85 = true := by decide +kernel
end E218S161
