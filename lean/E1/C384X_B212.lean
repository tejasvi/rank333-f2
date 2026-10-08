module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2282 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2282 1 = true := by decide +kernel
theorem okB2283 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2283 1 = true := by decide +kernel
theorem okB2284 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2284 1 = true := by decide +kernel
theorem okB2285 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2285 1 = true := by decide +kernel
theorem okB2286 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2286 1 = true := by decide +kernel
theorem okB2287 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2287 1 = true := by decide +kernel
theorem okB2288 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2288 1 = true := by decide +kernel
theorem okB2289 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2289 1 = true := by decide +kernel
theorem okG212 : glueChkR lits W 2282 8 = true := by decide +kernel
theorem okM212 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2282 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2282 1 = true := okB2282
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2282 2 = true := blkChk_join _ _ _ _ _ 2282 1 1 h0 okB2283
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2282 3 = true := blkChk_join _ _ _ _ _ 2282 2 1 h1 okB2284
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2282 4 = true := blkChk_join _ _ _ _ _ 2282 3 1 h2 okB2285
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2282 5 = true := blkChk_join _ _ _ _ _ 2282 4 1 h3 okB2286
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2282 6 = true := blkChk_join _ _ _ _ _ 2282 5 1 h4 okB2287
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2282 7 = true := blkChk_join _ _ _ _ _ 2282 6 1 h5 okB2288
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2282 8 = true := blkChk_join _ _ _ _ _ 2282 7 1 h6 okB2289
  exact h7
end E1.C384X
