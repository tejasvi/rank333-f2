module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S339_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E284S339
theorem ok25 : S7X.chunkT (lits.getD 0 0) paths recs 1418 64 4128 = true := by decide +kernel
end E284S339
