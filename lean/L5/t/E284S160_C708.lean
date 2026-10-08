module
public import R22Port.U_d41d8cd98f00
public import L5.t.E284S160_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E284S160
theorem ok708 : S7X.chunkT (lits.getD 0 0) paths recs 37587 64 48929 = true := by decide +kernel
end E284S160
