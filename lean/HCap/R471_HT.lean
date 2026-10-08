module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h471
public import HCap.SL_h471
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R471`: 6350 jobs (frontier r22/lean/hcap/run/c471/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R471_HT "data/lean/4f41a7652226e8750b5ead78d83515d1/R471_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R471_OF "data/lean/eb1066ff403227fbc391ea60891634e8/R471_OF.bin" 64 32
#rttablew E1G.R471_WT "data/lean/342516849b63d5349045963c15f59be4/R471_WT.bin" 64 32
noncomputable def E1G.R471_Wf (i j : ℕ) : ℕ := E1G.R471_WT.entry (E1G.R471_OF.entry i + j)
