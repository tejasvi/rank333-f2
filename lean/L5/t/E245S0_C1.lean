module
public import R22Port.U_d41d8cd98f00
public import L5.t.E245S0_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E245S0
theorem ok1 : S7X.chunkT (lits.getD 0 0) paths recs 28 17 768 = true := by decide +kernel
end E245S0
