module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S108_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E284S108
theorem ok5 : S7X.chunkT (lits.getD 0 0) paths recs 108 64 173 = true := by decide +kernel
end E284S108
