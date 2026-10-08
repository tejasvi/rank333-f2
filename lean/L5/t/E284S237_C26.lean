module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S237_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E284S237
theorem ok26 : S7X.chunkT (lits.getD 0 0) paths recs 1492 64 1732 = true := by decide +kernel
end E284S237
