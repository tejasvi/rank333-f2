module
public import R22Port.U_d41d8cd98f00
public import L5.t.E392S1_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E392S1
theorem ok3 : S7X.chunkT (lits.getD 0 0) paths recs 192 64 804 = true := by decide +kernel
end E392S1
