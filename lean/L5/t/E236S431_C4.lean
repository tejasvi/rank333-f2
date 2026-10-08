module
public import R22Port.U_d41d8cd98f00
public import L5.t.E236S431_Data
@[expose] public section
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
namespace E236S431
theorem ok4 : S7X.chunkT (lits.getD 0 0) paths recs 16 64 160 = true := by decide +kernel
end E236S431
