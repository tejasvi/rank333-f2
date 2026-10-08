module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S153_374`: 25 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_153.374/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S153_374_HT "data/lean/d6bda6a09c1ba37a6239fb7a6f8cd4e3/S153_374_HT.bin" 64 80
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S153_374_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S153_374_OF.bin" 64 32
#rttablew E1G.S153_374_WT "data/lean/f2177191712aaaacffc5306d78235780/S153_374_WT.bin" 64 32
noncomputable def E1G.S153_374_Wf (i j : ℕ) : ℕ := E1G.S153_374_WT.entry (E1G.S153_374_OF.entry i + j)
