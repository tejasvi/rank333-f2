module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S42_197`: 52 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_42.197/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S42_197_HT "data/lean/ad934614c692c51cf7ff6b443b14266d/S42_197_HT.bin" 64 80
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S42_197_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S42_197_OF.bin" 64 32
#rttablew E1G.S42_197_WT "data/lean/f4a80af43c357574efa3a459d90b7786/S42_197_WT.bin" 64 32
noncomputable def E1G.S42_197_Wf (i j : ℕ) : ℕ := E1G.S42_197_WT.entry (E1G.S42_197_OF.entry i + j)
