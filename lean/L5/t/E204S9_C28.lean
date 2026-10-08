module
public import R22Port.U_d41d8cd98f00
public import L5.t.E204S9_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E204S9
theorem ok28 : S7X.chunkT (lits.getD 0 0) paths recs 198 2 1080 = true := by decide +kernel
end E204S9
