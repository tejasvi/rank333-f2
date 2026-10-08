module
public import R22Port.U_d41d8cd98f00
public import L5.t.E237S36_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E237S36
theorem ok5 : S7X.chunkT (lits.getD 0 0) paths recs 36 5 41 = true := by decide +kernel
end E237S36
