module
public import R22Port.U_d41d8cd98f00
public import L5.t.E203S12_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E203S12
theorem ok7 : S7X.chunkT (lits.getD 0 0) paths recs 17 1 4082 = true := by decide +kernel
end E203S12
