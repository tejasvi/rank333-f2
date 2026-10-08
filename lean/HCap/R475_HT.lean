module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h475
public import HCap.SL_h475
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R475`: 3116 jobs (frontier r22/lean/hcap/run/c475/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R475_HT "data/lean/613a503ca74d91353f15327fa45ee288/R475_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R475_OF "data/lean/5ce4558fd8b4d2c94c384169634e14af/R475_OF.bin" 64 32
#rttablew E1G.R475_WT "data/lean/5460fc733dbbf619fa25c607f4c6b274/R475_WT.bin" 64 32
noncomputable def E1G.R475_Wf (i j : ℕ) : ℕ := E1G.R475_WT.entry (E1G.R475_OF.entry i + j)
