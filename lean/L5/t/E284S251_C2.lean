module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S251_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E284S251
theorem ok2 : S7X.chunkT (lits.getD 0 0) paths recs 87 12 99 = true := by decide +kernel
end E284S251
