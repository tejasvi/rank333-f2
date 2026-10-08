module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3712 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3713 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3713 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3714 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3714 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3715 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3715 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3716 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3716 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3717 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3717 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3718 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3718 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3719 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3719 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3720 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3720 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3721 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3721 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3722 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3722 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3723 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3723 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3724 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3724 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG390 : glueChkR lits W 3712 13 = true := by
  rw [← glueChkRN_eq lits W 7747 3712 lenT]; decide +kernel
theorem okM390 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 1 = true := okB3712
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 2 = true := blkChk_join _ _ _ _ _ 3712 1 1 h0 okB3713
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 3 = true := blkChk_join _ _ _ _ _ 3712 2 1 h1 okB3714
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 4 = true := blkChk_join _ _ _ _ _ 3712 3 1 h2 okB3715
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 5 = true := blkChk_join _ _ _ _ _ 3712 4 1 h3 okB3716
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 6 = true := blkChk_join _ _ _ _ _ 3712 5 1 h4 okB3717
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 7 = true := blkChk_join _ _ _ _ _ 3712 6 1 h5 okB3718
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 8 = true := blkChk_join _ _ _ _ _ 3712 7 1 h6 okB3719
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 9 = true := blkChk_join _ _ _ _ _ 3712 8 1 h7 okB3720
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 10 = true := blkChk_join _ _ _ _ _ 3712 9 1 h8 okB3721
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 11 = true := blkChk_join _ _ _ _ _ 3712 10 1 h9 okB3722
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 12 = true := blkChk_join _ _ _ _ _ 3712 11 1 h10 okB3723
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3712 13 = true := blkChk_join _ _ _ _ _ 3712 12 1 h11 okB3724
  exact h12
end E1.C284X
