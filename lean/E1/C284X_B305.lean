module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2802 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2803 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2803 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2804 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2804 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2805 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2805 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2806 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2806 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2807 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2807 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2808 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2808 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2809 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2809 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2810 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2810 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG305 : glueChkR lits W 2802 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2802 lenT]; decide +kernel
theorem okM305 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 1 = true := okB2802
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 2 = true := blkChk_join _ _ _ _ _ 2802 1 1 h0 okB2803
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 3 = true := blkChk_join _ _ _ _ _ 2802 2 1 h1 okB2804
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 4 = true := blkChk_join _ _ _ _ _ 2802 3 1 h2 okB2805
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 5 = true := blkChk_join _ _ _ _ _ 2802 4 1 h3 okB2806
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 6 = true := blkChk_join _ _ _ _ _ 2802 5 1 h4 okB2807
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 7 = true := blkChk_join _ _ _ _ _ 2802 6 1 h5 okB2808
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 8 = true := blkChk_join _ _ _ _ _ 2802 7 1 h6 okB2809
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2802 9 = true := blkChk_join _ _ _ _ _ 2802 8 1 h7 okB2810
  exact h8
end E1.C284X
