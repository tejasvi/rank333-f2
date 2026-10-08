module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S42_1104_3`: 75 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_42.1104.3/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S42_1104_3_HT "data/lean/d65d0ef96740ef4cada152bcba1bc908/S42_1104_3_HT.bin" 64 88
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S42_1104_3_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S42_1104_3_OF.bin" 64 32
#rttablew E1G.S42_1104_3_WT "data/lean/88ef382d5bc793cac36c951539f88fa8/S42_1104_3_WT.bin" 64 32
noncomputable def E1G.S42_1104_3_Wf (i j : ℕ) : ℕ := E1G.S42_1104_3_WT.entry (E1G.S42_1104_3_OF.entry i + j)
