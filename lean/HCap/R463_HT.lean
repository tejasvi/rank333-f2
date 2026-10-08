module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h463
public import HCap.SL_h463
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R463`: 1667 jobs (frontier r22/lean/hcap/run/c463/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R463_HT "data/lean/1a017c2bd72ce3e262443f1b1551dfb3/R463_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R463_OF "data/lean/94390a7d60893b55e837b8abfb3e97c2/R463_OF.bin" 64 32
#rttablew E1G.R463_WT "data/lean/896760fe2271641bd784385e1a6721d5/R463_WT.bin" 64 32
noncomputable def E1G.R463_Wf (i j : ℕ) : ℕ := E1G.R463_WT.entry (E1G.R463_OF.entry i + j)
