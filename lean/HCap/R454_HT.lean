module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h454
public import HCap.SL_h454
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R454`: 27623 jobs (frontier r22/lean/hcap/run/c454/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R454_HT "data/lean/d5f7e66f224cc7e999814fccdad351c9/R454_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R454_OF "data/lean/91167214693261dea8a0e583efb1012e/R454_OF.bin" 64 32
#rttablew E1G.R454_WT "data/lean/d933d592f06fac116ad8cf6925a3d66e/R454_WT.bin" 64 32
noncomputable def E1G.R454_Wf (i j : ℕ) : ℕ := E1G.R454_WT.entry (E1G.R454_OF.entry i + j)
