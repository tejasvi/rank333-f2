module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S153_1034`: 26 sub-jobs (r22/lean/native/e1/run/store3/split/l479s_153.1034/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S153_1034_HT "data/lean/e83220bdeb8d457605ea7573b20713ce/S153_1034_HT.bin" 64 80
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S153_1034_OF "data/lean/f1d3ff8443297732862df21dc4e57262/S153_1034_OF.bin" 64 32
#rttablew E1G.S153_1034_WT "data/lean/2dde1cb4a6ad5915f03a0bb8bacce3ca/S153_1034_WT.bin" 64 32
noncomputable def E1G.S153_1034_Wf (i j : ℕ) : ℕ := E1G.S153_1034_WT.entry (E1G.S153_1034_OF.entry i + j)
