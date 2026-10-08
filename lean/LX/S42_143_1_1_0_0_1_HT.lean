module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S42_143_1_1_0_0_1`: 56 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_42.143.1.1.0.0.1/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S42_143_1_1_0_0_1_HT "data/lean/14e63b210cea80377b90643a626921e1/S42_143_1_1_0_0_1_HT.bin" 64 112
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S42_143_1_1_0_0_1_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S42_143_1_1_0_0_1_OF.bin" 64 32
#rttablew E1G.S42_143_1_1_0_0_1_WT "data/lean/60c55d4c2dfd2550b20a1b2c3ce5d150/S42_143_1_1_0_0_1_WT.bin" 64 32
noncomputable def E1G.S42_143_1_1_0_0_1_Wf (i j : ℕ) : ℕ := E1G.S42_143_1_1_0_0_1_WT.entry (E1G.S42_143_1_1_0_0_1_OF.entry i + j)
