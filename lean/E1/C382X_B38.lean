module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB412 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 1 = true := by decide +kernel
theorem okB413 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 413 1 = true := by decide +kernel
theorem okB414 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 414 1 = true := by decide +kernel
theorem okB415 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 415 1 = true := by decide +kernel
theorem okB416 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 416 1 = true := by decide +kernel
theorem okB417 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 417 1 = true := by decide +kernel
theorem okB418 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 418 1 = true := by decide +kernel
theorem okB419 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 419 1 = true := by decide +kernel
theorem okB420 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 420 1 = true := by decide +kernel
theorem okB421 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 421 1 = true := by decide +kernel
theorem okB422 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 422 1 = true := by decide +kernel
theorem okB423 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 423 1 = true := by decide +kernel
theorem okG38 : glueChkR lits W 412 12 = true := by decide +kernel
theorem okM38 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 12 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 1 = true := okB412
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 2 = true := blkChk_join _ _ _ _ _ 412 1 1 h0 okB413
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 3 = true := blkChk_join _ _ _ _ _ 412 2 1 h1 okB414
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 4 = true := blkChk_join _ _ _ _ _ 412 3 1 h2 okB415
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 5 = true := blkChk_join _ _ _ _ _ 412 4 1 h3 okB416
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 6 = true := blkChk_join _ _ _ _ _ 412 5 1 h4 okB417
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 7 = true := blkChk_join _ _ _ _ _ 412 6 1 h5 okB418
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 8 = true := blkChk_join _ _ _ _ _ 412 7 1 h6 okB419
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 9 = true := blkChk_join _ _ _ _ _ 412 8 1 h7 okB420
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 10 = true := blkChk_join _ _ _ _ _ 412 9 1 h8 okB421
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 11 = true := blkChk_join _ _ _ _ _ 412 10 1 h9 okB422
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 412 12 = true := blkChk_join _ _ _ _ _ 412 11 1 h10 okB423
  exact h11
end E1.C382X
