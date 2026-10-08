module
public import R22Port.U_d41d8cd98f00
public import L5.t.E213S222_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E213S222
theorem ok10 : S7X.chunkT (lits.getD 0 0) paths recs 394 22 416 = true := by decide +kernel
end E213S222
