module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S20_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E204S20
theorem ok54 : S7X.chunkT (lits.getD 0 0) paths recs 224 2 4591 = true := by decide +kernel
end E204S20
