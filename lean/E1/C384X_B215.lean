module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2313 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 1 = true := by decide +kernel
theorem okB2314 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2314 1 = true := by decide +kernel
theorem okB2315 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2315 1 = true := by decide +kernel
theorem okB2316 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2316 1 = true := by decide +kernel
theorem okB2317 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2317 1 = true := by decide +kernel
theorem okB2318 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2318 1 = true := by decide +kernel
theorem okB2319 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2319 1 = true := by decide +kernel
theorem okB2320 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2320 1 = true := by decide +kernel
theorem okB2321 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2321 1 = true := by decide +kernel
theorem okG215 : glueChkR lits W 2313 9 = true := by decide +kernel
theorem okM215 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 1 = true := okB2313
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 2 = true := blkChk_join _ _ _ _ _ 2313 1 1 h0 okB2314
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 3 = true := blkChk_join _ _ _ _ _ 2313 2 1 h1 okB2315
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 4 = true := blkChk_join _ _ _ _ _ 2313 3 1 h2 okB2316
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 5 = true := blkChk_join _ _ _ _ _ 2313 4 1 h3 okB2317
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 6 = true := blkChk_join _ _ _ _ _ 2313 5 1 h4 okB2318
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 7 = true := blkChk_join _ _ _ _ _ 2313 6 1 h5 okB2319
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 8 = true := blkChk_join _ _ _ _ _ 2313 7 1 h6 okB2320
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2313 9 = true := blkChk_join _ _ _ _ _ 2313 8 1 h7 okB2321
  exact h8
end E1.C384X
