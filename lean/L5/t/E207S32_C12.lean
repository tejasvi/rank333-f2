module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S32_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E207S32
theorem ok12 : S7X.chunkT (lits.getD 0 0) paths recs 358 54 1261 = true := by decide +kernel
end E207S32
