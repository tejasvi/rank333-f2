module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h490
public import HCap.SL_h490
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R490`: 20504 jobs (frontier r22/lean/hcap/run/c490/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R490_HT "data/lean/1ed8bdca376dafead85ce7b83ce10fe7/R490_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R490_OF "data/lean/5aed507d9888fc36cf2725318a726991/R490_OF.bin" 64 32
#rttablew E1G.R490_WT "data/lean/ab4c42ff1027854aaccb9d8bf7230b38/R490_WT.bin" 64 32
noncomputable def E1G.R490_Wf (i j : ℕ) : ℕ := E1G.R490_WT.entry (E1G.R490_OF.entry i + j)
