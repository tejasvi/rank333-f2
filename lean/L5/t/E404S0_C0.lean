module
public import R22Port.U_d41d8cd98f00
public import L5.t.E404S0_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E404S0
theorem ok0 : S7X.chunkT (lits.getD 0 0) paths recs 0 10 10 = true := by decide +kernel
end E404S0
