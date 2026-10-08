module
public import R22Port.U_d41d8cd98f00
public import L5.t.E279S3_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E279S3
theorem ok13 : S7X.chunkT (lits.getD 0 0) paths recs 415 64 923 = true := by decide +kernel
end E279S3
