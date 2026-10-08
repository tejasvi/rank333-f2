module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import E1G.IP_l479cw
public import E1G.SL_l479cw
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R479`: 30557 jobs (frontier r22/lean/hcls/E1P/run/l479c2/root/fr5cw.txt), entry k = the header of job k's first block -/
#rttablew E1G.R479_HT "data/lean/c9d9a3ff09c6d43ed0cd988857afb254/R479_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R479_OF "data/lean/853646e11081f45e21e0194a41906e8f/R479_OF.bin" 64 32
#rttablew E1G.R479_WT "data/lean/41d93e5460c90b2c6ca2af94eb0feb7e/R479_WT.bin" 64 32
noncomputable def E1G.R479_Wf (i j : ℕ) : ℕ := E1G.R479_WT.entry (E1G.R479_OF.entry i + j)
