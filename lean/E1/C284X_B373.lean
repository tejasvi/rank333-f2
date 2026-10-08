module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3513 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3514 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3514 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3515 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3515 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3516 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3516 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3517 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3517 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3518 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3518 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3519 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3519 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3520 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3520 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3521 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3521 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3522 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3522 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3523 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3523 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3524 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3524 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3525 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3525 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3526 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3526 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG373 : glueChkR lits W 3513 14 = true := by
  rw [← glueChkRN_eq lits W 7747 3513 lenT]; decide +kernel
theorem okM373 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 14 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 1 = true := okB3513
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 2 = true := blkChk_join _ _ _ _ _ 3513 1 1 h0 okB3514
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 3 = true := blkChk_join _ _ _ _ _ 3513 2 1 h1 okB3515
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 4 = true := blkChk_join _ _ _ _ _ 3513 3 1 h2 okB3516
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 5 = true := blkChk_join _ _ _ _ _ 3513 4 1 h3 okB3517
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 6 = true := blkChk_join _ _ _ _ _ 3513 5 1 h4 okB3518
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 7 = true := blkChk_join _ _ _ _ _ 3513 6 1 h5 okB3519
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 8 = true := blkChk_join _ _ _ _ _ 3513 7 1 h6 okB3520
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 9 = true := blkChk_join _ _ _ _ _ 3513 8 1 h7 okB3521
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 10 = true := blkChk_join _ _ _ _ _ 3513 9 1 h8 okB3522
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 11 = true := blkChk_join _ _ _ _ _ 3513 10 1 h9 okB3523
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 12 = true := blkChk_join _ _ _ _ _ 3513 11 1 h10 okB3524
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 13 = true := blkChk_join _ _ _ _ _ 3513 12 1 h11 okB3525
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3513 14 = true := blkChk_join _ _ _ _ _ 3513 13 1 h12 okB3526
  exact h13
end E1.C284X
