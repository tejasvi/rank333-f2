module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2723 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2724 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2724 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2725 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2725 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2726 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2726 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2727 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2727 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2728 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2728 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2729 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2729 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2730 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2730 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2731 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2731 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG296 : glueChkR lits W 2723 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2723 lenT]; decide +kernel
theorem okM296 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 1 = true := okB2723
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 2 = true := blkChk_join _ _ _ _ _ 2723 1 1 h0 okB2724
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 3 = true := blkChk_join _ _ _ _ _ 2723 2 1 h1 okB2725
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 4 = true := blkChk_join _ _ _ _ _ 2723 3 1 h2 okB2726
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 5 = true := blkChk_join _ _ _ _ _ 2723 4 1 h3 okB2727
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 6 = true := blkChk_join _ _ _ _ _ 2723 5 1 h4 okB2728
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 7 = true := blkChk_join _ _ _ _ _ 2723 6 1 h5 okB2729
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 8 = true := blkChk_join _ _ _ _ _ 2723 7 1 h6 okB2730
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2723 9 = true := blkChk_join _ _ _ _ _ 2723 8 1 h7 okB2731
  exact h8
end E1.C284X
