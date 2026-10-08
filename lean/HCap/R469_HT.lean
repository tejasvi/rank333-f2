module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h469
public import HCap.SL_h469
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R469`: 3575 jobs (frontier r22/lean/hcap/run/c469/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R469_HT "data/lean/86b4258b195bd417ab002382b6e31968/R469_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R469_OF "data/lean/cde4ed880e3d4786b65d17be9aff164f/R469_OF.bin" 64 32
#rttablew E1G.R469_WT "data/lean/95a09643bc678a4ec47e88a77726eb9b/R469_WT.bin" 64 32
noncomputable def E1G.R469_Wf (i j : ℕ) : ℕ := E1G.R469_WT.entry (E1G.R469_OF.entry i + j)
