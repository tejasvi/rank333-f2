module
public import R22Port.U_d41d8cd98f00
public import L5.t.E408S4_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E408S4
theorem ok3 : S7X.chunkT (lits.getD 0 0) paths recs 192 60 252 = true := by decide +kernel
end E408S4
