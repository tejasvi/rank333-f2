module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h485
public import HCap.SL_h485
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R485`: 10618 jobs (frontier r22/lean/hcap/run/c485/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R485_HT "data/lean/4e7bbef8ea4b2d7cfd2bc2b643d1a576/R485_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R485_OF "data/lean/73b06779f36a809469b2e3dd8404f55b/R485_OF.bin" 64 32
#rttablew E1G.R485_WT "data/lean/10dbd97279b998b051af29b9ade393bb/R485_WT.bin" 64 32
noncomputable def E1G.R485_Wf (i j : ℕ) : ℕ := E1G.R485_WT.entry (E1G.R485_OF.entry i + j)
