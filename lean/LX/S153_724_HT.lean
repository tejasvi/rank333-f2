module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S153_724`: 23 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_153.724/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S153_724_HT "data/lean/f6607aeb74db0f6fd4c58a58a3300e8e/S153_724_HT.bin" 64 80
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S153_724_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S153_724_OF.bin" 64 32
#rttablew E1G.S153_724_WT "data/lean/5e8fda7456998ea19fb99cb64967fbb2/S153_724_WT.bin" 64 32
noncomputable def E1G.S153_724_Wf (i j : ℕ) : ℕ := E1G.S153_724_WT.entry (E1G.S153_724_OF.entry i + j)
