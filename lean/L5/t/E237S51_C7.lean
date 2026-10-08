module
public import R22Port.U_d41d8cd98f00
public import L5.t.E237S51_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E237S51
theorem ok7 : S7X.chunkT (lits.getD 0 0) paths recs 46 35 81 = true := by decide +kernel
end E237S51
