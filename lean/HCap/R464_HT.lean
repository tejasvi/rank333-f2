module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h464
public import HCap.SL_h464
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R464`: 6923 jobs (frontier r22/lean/hcap/run/c464/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R464_HT "data/lean/ff05f7d976b0262a022c6b00b5a9ab42/R464_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R464_OF "data/lean/3bf16c2ea180a3501ff6ed1c41d82f5c/R464_OF.bin" 64 32
#rttablew E1G.R464_WT "data/lean/53a82aeebee663642d83516a626a40a0/R464_WT.bin" 64 32
noncomputable def E1G.R464_Wf (i j : ℕ) : ℕ := E1G.R464_WT.entry (E1G.R464_OF.entry i + j)
