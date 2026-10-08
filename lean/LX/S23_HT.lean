module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S23`: 2278 sub-jobs (r22/lean/native/e1/run/store3/split/l479_23/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S23_HT "data/lean/4773f9f5c480da52c9ecb1538e31123e/S23_HT.bin" 64 72
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S23_OF "data/lean/e53347fdffb960b0a031547830b4ea42/S23_OF.bin" 64 32
#rttablew E1G.S23_WT "data/lean/43db88435400121f5af056cb853e5836/S23_WT.bin" 64 32
noncomputable def E1G.S23_Wf (i j : ℕ) : ℕ := E1G.S23_WT.entry (E1G.S23_OF.entry i + j)
