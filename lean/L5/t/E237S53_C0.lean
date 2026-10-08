module
public import R22Port.U_d41d8cd98f00
public import L5.t.E237S53_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E237S53
theorem ok0 : S7X.chunkT (lits.getD 0 0) paths recs 0 6 12 = true := by decide +kernel
end E237S53
