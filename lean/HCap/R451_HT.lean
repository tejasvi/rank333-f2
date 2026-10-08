module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h451
public import HCap.SL_h451
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R451`: 3982 jobs (frontier r22/lean/hcap/run/c451/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R451_HT "data/lean/986d0b5a11626ada56d45e6d0225ee8a/R451_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R451_OF "data/lean/67b103a04fcc9609284012d61889262a/R451_OF.bin" 64 32
#rttablew E1G.R451_WT "data/lean/516d80757b823f249c32b9b077021e78/R451_WT.bin" 64 32
noncomputable def E1G.R451_Wf (i j : ℕ) : ℕ := E1G.R451_WT.entry (E1G.R451_OF.entry i + j)
