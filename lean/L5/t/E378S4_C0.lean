module
public import R22Port.U_d41d8cd98f00
public import L5.t.E378S4_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E378S4
theorem ok0 : S7X.chunkT (lits.getD 0 0) paths recs 0 13 13 = true := by decide +kernel
end E378S4
