module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S42_143_1_1_0_0`: 57 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_42.143.1.1.0.0/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S42_143_1_1_0_0_HT "data/lean/7b7e444e62427e70bcfe0758e044dc7f/S42_143_1_1_0_0_HT.bin" 64 104
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S42_143_1_1_0_0_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S42_143_1_1_0_0_OF.bin" 64 32
#rttablew E1G.S42_143_1_1_0_0_WT "data/lean/180d64e3abaa06e0c49924771be2f9be/S42_143_1_1_0_0_WT.bin" 64 32
noncomputable def E1G.S42_143_1_1_0_0_Wf (i j : ℕ) : ℕ := E1G.S42_143_1_1_0_0_WT.entry (E1G.S42_143_1_1_0_0_OF.entry i + j)
