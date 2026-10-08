module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S32_293_0_1`: 82 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_32.293.0.1/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S32_293_0_1_HT "data/lean/e7159a57a35c108f3bda5c06516df7e2/S32_293_0_1_HT.bin" 64 96
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S32_293_0_1_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S32_293_0_1_OF.bin" 64 32
#rttablew E1G.S32_293_0_1_WT "data/lean/42aedcad7bc82f6240578e99aa7ddac3/S32_293_0_1_WT.bin" 64 32
noncomputable def E1G.S32_293_0_1_Wf (i j : ℕ) : ℕ := E1G.S32_293_0_1_WT.entry (E1G.S32_293_0_1_OF.entry i + j)
