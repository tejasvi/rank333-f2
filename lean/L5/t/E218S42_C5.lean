module
public import R22Port.U_d41d8cd98f00
public import L5.t.E218S42_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E218S42
theorem ok5 : S7X.chunkT (lits.getD 0 0) paths recs 103 64 194 = true := by decide +kernel
end E218S42
