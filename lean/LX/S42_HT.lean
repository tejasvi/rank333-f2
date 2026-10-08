module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The sub-job header table of the split `S42`: 2255 sub-jobs (r22/lean/native/e1/run/store3/split/l479_42/sub.txt), entry k = the header of sub-job k's first block -/
#rttablew E1G.S42_HT "data/lean/0718f40ea7b9e2253b3d2701041ca564/S42_HT.bin" 64 72
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for sub-job `k`)
#rttablew E1G.S42_OF "data/lean/63690562b32d17e63ff33c6c6c2e9267/S42_OF.bin" 64 32
#rttablew E1G.S42_WT "data/lean/d66fbcc0a49d298d51f18dd2f782d7c1/S42_WT.bin" 64 32
noncomputable def E1G.S42_Wf (i j : ℕ) : ℕ := E1G.S42_WT.entry (E1G.S42_OF.entry i + j)
