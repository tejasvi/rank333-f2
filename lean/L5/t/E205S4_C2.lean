module
public import R22Port.U_d41d8cd98f00
public import L5.t.E205S4_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E205S4
theorem ok2 : S7X.chunkT (lits.getD 0 0) paths recs 6 34 183 = true := by decide +kernel
end E205S4
