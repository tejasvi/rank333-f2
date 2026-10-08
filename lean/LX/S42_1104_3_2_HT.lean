module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S42_1104_3_2`: 76 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_42.1104.3.2/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S42_1104_3_2_HT "data/lean/04796ec6637c6eb608ddae26054c8873/S42_1104_3_2_HT.bin" 64 96
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S42_1104_3_2_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S42_1104_3_2_OF.bin" 64 32
#rttablew E1G.S42_1104_3_2_WT "data/lean/4f79472ad638a8adaf6e3323bd005730/S42_1104_3_2_WT.bin" 64 32
noncomputable def E1G.S42_1104_3_2_Wf (i j : ℕ) : ℕ := E1G.S42_1104_3_2_WT.entry (E1G.S42_1104_3_2_OF.entry i + j)
