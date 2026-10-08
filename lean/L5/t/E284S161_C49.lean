module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S161_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E284S161
theorem ok49 : S7X.chunkT (lits.getD 0 0) paths recs 552 22 8913 = true := by decide +kernel
end E284S161
