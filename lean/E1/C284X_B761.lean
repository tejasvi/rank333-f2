module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7559 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7560 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7560 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7561 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7561 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7562 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7562 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7563 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7563 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7564 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7564 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7565 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7565 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7566 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7566 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7567 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7567 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG761 : glueChkR lits W 7559 9 = true := by
  rw [← glueChkRN_eq lits W 7747 7559 lenT]; decide +kernel
theorem okM761 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 1 = true := okB7559
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 2 = true := blkChk_join _ _ _ _ _ 7559 1 1 h0 okB7560
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 3 = true := blkChk_join _ _ _ _ _ 7559 2 1 h1 okB7561
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 4 = true := blkChk_join _ _ _ _ _ 7559 3 1 h2 okB7562
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 5 = true := blkChk_join _ _ _ _ _ 7559 4 1 h3 okB7563
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 6 = true := blkChk_join _ _ _ _ _ 7559 5 1 h4 okB7564
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 7 = true := blkChk_join _ _ _ _ _ 7559 6 1 h5 okB7565
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 8 = true := blkChk_join _ _ _ _ _ 7559 7 1 h6 okB7566
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7559 9 = true := blkChk_join _ _ _ _ _ 7559 8 1 h7 okB7567
  exact h8
end E1.C284X
