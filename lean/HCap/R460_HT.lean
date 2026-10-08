module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h460
public import HCap.SL_h460
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R460`: 579 jobs (frontier r22/lean/hcap/run/c460/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R460_HT "data/lean/ee407d1edd4e5d86f223e0d48d6e456a/R460_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R460_OF "data/lean/e32037d62de49d81b1a18f5dfc47136f/R460_OF.bin" 64 32
#rttablew E1G.R460_WT "data/lean/704d985e187d28765497b7288db8f6cf/R460_WT.bin" 64 32
noncomputable def E1G.R460_Wf (i j : ℕ) : ℕ := E1G.R460_WT.entry (E1G.R460_OF.entry i + j)
