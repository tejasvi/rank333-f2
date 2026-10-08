module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S28_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E204S28
theorem ok0 : S7X.chunkT (lits.getD 0 0) paths recs 0 2 25 = true := by decide +kernel
end E204S28
