module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S32_293_0_1_0_0_2`: 77 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_32.293.0.1.0.0.2/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S32_293_0_1_0_0_2_HT "data/lean/79951951da17c332a05ca328316772cd/S32_293_0_1_0_0_2_HT.bin" 64 112
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S32_293_0_1_0_0_2_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S32_293_0_1_0_0_2_OF.bin" 64 32
#rttablew E1G.S32_293_0_1_0_0_2_WT "data/lean/f3b87639f4d5c3a4af748252376b83d1/S32_293_0_1_0_0_2_WT.bin" 64 32
noncomputable def E1G.S32_293_0_1_0_0_2_Wf (i j : ℕ) : ℕ := E1G.S32_293_0_1_0_0_2_WT.entry (E1G.S32_293_0_1_0_0_2_OF.entry i + j)
