module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S19_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E204S19
theorem ok61 : S7X.chunkT (lits.getD 0 0) paths recs 294 11 4777 = true := by decide +kernel
end E204S19
