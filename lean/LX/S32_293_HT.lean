module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S32_293`: 24 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_32.293/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S32_293_HT "data/lean/a3a75a285d2473bddefb7b851ee4713e/S32_293_HT.bin" 64 80
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S32_293_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S32_293_OF.bin" 64 32
#rttablew E1G.S32_293_WT "data/lean/a35827f8d0bb4b868673e0b46b2b4d1c/S32_293_WT.bin" 64 32
noncomputable def E1G.S32_293_Wf (i j : ℕ) : ℕ := E1G.S32_293_WT.entry (E1G.S32_293_OF.entry i + j)
