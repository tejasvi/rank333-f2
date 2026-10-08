module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S153`: 6022 sub-jobs (r22/lean/native/e1/run/store3/split/l479_153/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S153_HT "data/lean/874181d47e7f5e1dec292e8c22f25b91/S153_HT.bin" 64 72
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S153_OF "data/lean/d7155d812b61e1fda20a9cecff13c94b/S153_OF.bin" 64 32
#rttablew E1G.S153_WT "data/lean/55d4288010be05e36b627e1fac235de4/S153_WT.bin" 64 32
noncomputable def E1G.S153_Wf (i j : ℕ) : ℕ := E1G.S153_WT.entry (E1G.S153_OF.entry i + j)
