module
public import R22Port.U_d41d8cd98f00
public import L5.t.E382S7_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E382S7
theorem ok1 : S7X.chunkT (lits.getD 0 0) paths recs 64 3 67 = true := by decide +kernel
end E382S7
