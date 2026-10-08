module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB498 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 1 = true := by decide +kernel
theorem okB499 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 499 1 = true := by decide +kernel
theorem okB500 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 500 1 = true := by decide +kernel
theorem okB501 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 501 1 = true := by decide +kernel
theorem okB502 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 502 1 = true := by decide +kernel
theorem okB503 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 503 1 = true := by decide +kernel
theorem okB504 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 504 1 = true := by decide +kernel
theorem okB505 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 505 1 = true := by decide +kernel
theorem okB506 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 506 1 = true := by decide +kernel
theorem okG45 : glueChkR lits W 498 9 = true := by decide +kernel
theorem okM45 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 9 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 1 = true := okB498
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 2 = true := blkChk_join _ _ _ _ _ 498 1 1 h0 okB499
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 3 = true := blkChk_join _ _ _ _ _ 498 2 1 h1 okB500
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 4 = true := blkChk_join _ _ _ _ _ 498 3 1 h2 okB501
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 5 = true := blkChk_join _ _ _ _ _ 498 4 1 h3 okB502
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 6 = true := blkChk_join _ _ _ _ _ 498 5 1 h4 okB503
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 7 = true := blkChk_join _ _ _ _ _ 498 6 1 h5 okB504
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 8 = true := blkChk_join _ _ _ _ _ 498 7 1 h6 okB505
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 498 9 = true := blkChk_join _ _ _ _ _ 498 8 1 h7 okB506
  exact h8
end E1.C387X
