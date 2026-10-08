module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S153_374_0_0`: 75 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_153.374.0.0/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S153_374_0_0_HT "data/lean/46e19d30054d5836477628f1e49630f3/S153_374_0_0_HT.bin" 64 96
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S153_374_0_0_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S153_374_0_0_OF.bin" 64 32
#rttablew E1G.S153_374_0_0_WT "data/lean/88ef382d5bc793cac36c951539f88fa8/S153_374_0_0_WT.bin" 64 32
noncomputable def E1G.S153_374_0_0_Wf (i j : ℕ) : ℕ := E1G.S153_374_0_0_WT.entry (E1G.S153_374_0_0_OF.entry i + j)
