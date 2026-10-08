module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h476
public import HCap.SL_h476
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R476`: 8526 jobs (frontier r22/lean/hcap/run/c476/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R476_HT "data/lean/a0e1f9a25217f7861b4811b36c35946d/R476_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R476_OF "data/lean/8d5d9db1d9b48a6332172719f2812399/R476_OF.bin" 64 32
#rttablew E1G.R476_WT "data/lean/b792c1b5c284d4cd1a9ac69dbb6594cd/R476_WT.bin" 64 32
noncomputable def E1G.R476_Wf (i j : ℕ) : ℕ := E1G.R476_WT.entry (E1G.R476_OF.entry i + j)
