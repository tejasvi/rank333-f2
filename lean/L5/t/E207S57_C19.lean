module
public import R22Port.U_d41d8cd98f00
public import L5.t.E207S57_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E207S57
theorem ok19 : S7X.chunkT (lits.getD 0 0) paths recs 80 14 669 = true := by decide +kernel
end E207S57
