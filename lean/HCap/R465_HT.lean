module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h465
public import HCap.SL_h465
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R465`: 5227 jobs (frontier r22/lean/hcap/run/c465/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R465_HT "data/lean/b2d9eab143f3d438b9cc0392d3058f7f/R465_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R465_OF "data/lean/db75562285c57d76575e0db873f48c22/R465_OF.bin" 64 32
#rttablew E1G.R465_WT "data/lean/bc7e2b007edd26a57ad1b97d5aaa8def/R465_WT.bin" 64 32
noncomputable def E1G.R465_Wf (i j : ℕ) : ℕ := E1G.R465_WT.entry (E1G.R465_OF.entry i + j)
