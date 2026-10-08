module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h450
public import HCap.SL_h450
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R450`: 5948 jobs (frontier r22/lean/hcap/run/c450/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R450_HT "data/lean/e20ba87284dfaa64ac1a14ea03988c79/R450_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R450_OF "data/lean/847b57f77fd58daa9664c02723870fa6/R450_OF.bin" 64 32
#rttablew E1G.R450_WT "data/lean/e9bad9f8045d4581158e9b1d508c2f70/R450_WT.bin" 64 32
noncomputable def E1G.R450_Wf (i j : ℕ) : ℕ := E1G.R450_WT.entry (E1G.R450_OF.entry i + j)
