module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB495 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 1 = true := by decide +kernel
theorem okB496 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 496 1 = true := by decide +kernel
theorem okB497 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 497 1 = true := by decide +kernel
theorem okB498 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 498 1 = true := by decide +kernel
theorem okB499 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 499 1 = true := by decide +kernel
theorem okB500 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 500 1 = true := by decide +kernel
theorem okB501 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 501 1 = true := by decide +kernel
theorem okB502 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 502 1 = true := by decide +kernel
theorem okB503 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 503 1 = true := by decide +kernel
theorem okB504 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 504 1 = true := by decide +kernel
theorem okB505 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 505 1 = true := by decide +kernel
theorem okB506 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 506 1 = true := by decide +kernel
theorem okG45 : glueChkR lits W 495 12 = true := by decide +kernel
theorem okM45 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 12 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 1 = true := okB495
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 2 = true := blkChk_join _ _ _ _ _ 495 1 1 h0 okB496
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 3 = true := blkChk_join _ _ _ _ _ 495 2 1 h1 okB497
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 4 = true := blkChk_join _ _ _ _ _ 495 3 1 h2 okB498
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 5 = true := blkChk_join _ _ _ _ _ 495 4 1 h3 okB499
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 6 = true := blkChk_join _ _ _ _ _ 495 5 1 h4 okB500
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 7 = true := blkChk_join _ _ _ _ _ 495 6 1 h5 okB501
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 8 = true := blkChk_join _ _ _ _ _ 495 7 1 h6 okB502
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 9 = true := blkChk_join _ _ _ _ _ 495 8 1 h7 okB503
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 10 = true := blkChk_join _ _ _ _ _ 495 9 1 h8 okB504
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 11 = true := blkChk_join _ _ _ _ _ 495 10 1 h9 okB505
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 495 12 = true := blkChk_join _ _ _ _ _ 495 11 1 h10 okB506
  exact h11
end E1.C382X
