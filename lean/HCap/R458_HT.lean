module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h458
public import HCap.SL_h458
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R458`: 4828 jobs (frontier r22/lean/hcap/run/c458/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R458_HT "data/lean/c12bcc8c9226752fee742de5432ce118/R458_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R458_OF "data/lean/6d85422dd049b09c45b08f3146bb2c27/R458_OF.bin" 64 32
#rttablew E1G.R458_WT "data/lean/cbe9c86c1ddecb49289ecb32d35ee838/R458_WT.bin" 64 32
noncomputable def E1G.R458_Wf (i j : ℕ) : ℕ := E1G.R458_WT.entry (E1G.R458_OF.entry i + j)
