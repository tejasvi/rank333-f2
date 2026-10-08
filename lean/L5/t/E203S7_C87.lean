module
public import R22Port.U_d41d8cd98f00
public import L5.t.E203S7_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E203S7
theorem ok87 : S7X.chunkT (lits.getD 0 0) paths recs 838 25 10672 = true := by decide +kernel
end E203S7
