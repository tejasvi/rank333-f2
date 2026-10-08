module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB895 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB896 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB897 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB898 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB899 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB900 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB901 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB902 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 902 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB903 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 903 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB904 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 904 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB905 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 905 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB906 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 906 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB907 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 907 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB908 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 908 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG96 : glueChkR lits W 895 14 = true := by
  rw [← glueChkRN_eq lits W 7747 895 lenT]; decide +kernel
theorem okM96 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 14 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 1 = true := okB895
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 2 = true := blkChk_join _ _ _ _ _ 895 1 1 h0 okB896
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 3 = true := blkChk_join _ _ _ _ _ 895 2 1 h1 okB897
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 4 = true := blkChk_join _ _ _ _ _ 895 3 1 h2 okB898
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 5 = true := blkChk_join _ _ _ _ _ 895 4 1 h3 okB899
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 6 = true := blkChk_join _ _ _ _ _ 895 5 1 h4 okB900
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 7 = true := blkChk_join _ _ _ _ _ 895 6 1 h5 okB901
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 8 = true := blkChk_join _ _ _ _ _ 895 7 1 h6 okB902
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 9 = true := blkChk_join _ _ _ _ _ 895 8 1 h7 okB903
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 10 = true := blkChk_join _ _ _ _ _ 895 9 1 h8 okB904
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 11 = true := blkChk_join _ _ _ _ _ 895 10 1 h9 okB905
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 12 = true := blkChk_join _ _ _ _ _ 895 11 1 h10 okB906
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 13 = true := blkChk_join _ _ _ _ _ 895 12 1 h11 okB907
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 895 14 = true := blkChk_join _ _ _ _ _ 895 13 1 h12 okB908
  exact h13
end E1.C284X
