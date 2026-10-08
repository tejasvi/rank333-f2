module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S1_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E204S1
theorem ok2 : S7X.chunkT (lits.getD 0 0) paths recs 70 8 78 = true := by decide +kernel
end E204S1
