module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h456
public import HCap.SL_h456
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R456`: 10434 jobs (frontier r22/lean/hcap/run/c456/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R456_HT "data/lean/a7e362e31cc729631deec118db0e1079/R456_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R456_OF "data/lean/79fb45369bb038c2d7333428810146e7/R456_OF.bin" 64 32
#rttablew E1G.R456_WT "data/lean/fec7b5e4d85ea9b0bf40680e7412e1e1/R456_WT.bin" 64 32
noncomputable def E1G.R456_Wf (i j : ℕ) : ℕ := E1G.R456_WT.entry (E1G.R456_OF.entry i + j)
