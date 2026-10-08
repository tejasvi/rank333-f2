module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S32`: 1812 sub-jobs (r22/lean/native/e1/run/store3/split/l479_32/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S32_HT "data/lean/a34c10734e5f70c8eb6054b1daf5cf6d/S32_HT.bin" 64 72
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S32_OF "data/lean/7e286acc231a9c4379356e40f2236d01/S32_OF.bin" 64 32
#rttablew E1G.S32_WT "data/lean/37faaf6e8b4a46007fc420697922db74/S32_WT.bin" 64 32
noncomputable def E1G.S32_Wf (i j : ℕ) : ℕ := E1G.S32_WT.entry (E1G.S32_OF.entry i + j)
