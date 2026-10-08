module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S82_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E213S82
theorem ok55 : S7X.chunkT (lits.getD 0 0) paths recs 2865 16 2881 = true := by decide +kernel
end E213S82
