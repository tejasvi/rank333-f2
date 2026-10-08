module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3560 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3561 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3561 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3562 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3562 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3563 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3563 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3564 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3564 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3565 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3565 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3566 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3566 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3567 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3567 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3568 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3568 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG377 : glueChkR lits W 3560 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3560 lenT]; decide +kernel
theorem okM377 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 1 = true := okB3560
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 2 = true := blkChk_join _ _ _ _ _ 3560 1 1 h0 okB3561
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 3 = true := blkChk_join _ _ _ _ _ 3560 2 1 h1 okB3562
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 4 = true := blkChk_join _ _ _ _ _ 3560 3 1 h2 okB3563
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 5 = true := blkChk_join _ _ _ _ _ 3560 4 1 h3 okB3564
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 6 = true := blkChk_join _ _ _ _ _ 3560 5 1 h4 okB3565
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 7 = true := blkChk_join _ _ _ _ _ 3560 6 1 h5 okB3566
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 8 = true := blkChk_join _ _ _ _ _ 3560 7 1 h6 okB3567
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3560 9 = true := blkChk_join _ _ _ _ _ 3560 8 1 h7 okB3568
  exact h8
end E1.C284X
