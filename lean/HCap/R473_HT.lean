module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h473
public import HCap.SL_h473
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R473`: 9648 jobs (frontier r22/lean/hcap/run/c473/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R473_HT "data/lean/0eb564e1863edf9bf9c03d9300a2b86c/R473_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R473_OF "data/lean/c991f721629eebcdb9badaf6e2d9b8d9/R473_OF.bin" 64 32
#rttablew E1G.R473_WT "data/lean/c1aac01e4c307d83576a5e7f11c2f17a/R473_WT.bin" 64 32
noncomputable def E1G.R473_Wf (i j : ℕ) : ℕ := E1G.R473_WT.entry (E1G.R473_OF.entry i + j)
