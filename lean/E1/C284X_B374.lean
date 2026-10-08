module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3527 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3527 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3528 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3528 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3529 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3529 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3530 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3530 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3531 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3531 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3532 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3532 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3533 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3533 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3534 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3534 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG374 : glueChkR lits W 3527 8 = true := by
  rw [← glueChkRN_eq lits W 7747 3527 lenT]; decide +kernel
theorem okM374 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3527 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3527 1 = true := okB3527
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3527 2 = true := blkChk_join _ _ _ _ _ 3527 1 1 h0 okB3528
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3527 3 = true := blkChk_join _ _ _ _ _ 3527 2 1 h1 okB3529
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3527 4 = true := blkChk_join _ _ _ _ _ 3527 3 1 h2 okB3530
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3527 5 = true := blkChk_join _ _ _ _ _ 3527 4 1 h3 okB3531
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3527 6 = true := blkChk_join _ _ _ _ _ 3527 5 1 h4 okB3532
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3527 7 = true := blkChk_join _ _ _ _ _ 3527 6 1 h5 okB3533
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3527 8 = true := blkChk_join _ _ _ _ _ 3527 7 1 h6 okB3534
  exact h7
end E1.C284X
