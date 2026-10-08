module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S51_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E207S51
theorem ok0 : S7X.chunkT (lits.getD 0 0) paths recs 0 1 8 = true := by decide +kernel
end E207S51
