module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S194_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E213S194
theorem ok7 : S7X.chunkT (lits.getD 0 0) paths recs 37 12 241 = true := by decide +kernel
end E213S194
