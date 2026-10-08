module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3634 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3635 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3635 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3636 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3636 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3637 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3637 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3638 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3638 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3639 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3639 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3640 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3640 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3641 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3641 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3642 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3642 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3643 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3643 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3644 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3644 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG384 : glueChkR lits W 3634 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3634 lenT]; decide +kernel
theorem okM384 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 1 = true := okB3634
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 2 = true := blkChk_join _ _ _ _ _ 3634 1 1 h0 okB3635
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 3 = true := blkChk_join _ _ _ _ _ 3634 2 1 h1 okB3636
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 4 = true := blkChk_join _ _ _ _ _ 3634 3 1 h2 okB3637
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 5 = true := blkChk_join _ _ _ _ _ 3634 4 1 h3 okB3638
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 6 = true := blkChk_join _ _ _ _ _ 3634 5 1 h4 okB3639
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 7 = true := blkChk_join _ _ _ _ _ 3634 6 1 h5 okB3640
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 8 = true := blkChk_join _ _ _ _ _ 3634 7 1 h6 okB3641
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 9 = true := blkChk_join _ _ _ _ _ 3634 8 1 h7 okB3642
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 10 = true := blkChk_join _ _ _ _ _ 3634 9 1 h8 okB3643
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3634 11 = true := blkChk_join _ _ _ _ _ 3634 10 1 h9 okB3644
  exact h10
end E1.C284X
