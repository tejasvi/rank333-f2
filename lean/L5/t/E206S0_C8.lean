module
public import R22Port.U_d41d8cd98f00
public import L5.t.E206S0_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E206S0
theorem ok8 : S7X.chunkT (lits.getD 0 0) paths recs 458 64 616 = true := by decide +kernel
end E206S0
