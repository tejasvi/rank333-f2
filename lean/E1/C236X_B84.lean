module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB894 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB895 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB896 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB897 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB898 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB899 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB900 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB901 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB902 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 902 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB903 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 903 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB904 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 904 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB905 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 905 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB906 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 906 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG84 : glueChkR lits W 894 13 = true := by
  rw [← glueChkRN_eq lits W 8596 894 lenT]; decide +kernel
theorem okM84 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 13 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 1 = true := okB894
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 2 = true := blkChk_join _ _ _ _ _ 894 1 1 h0 okB895
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 3 = true := blkChk_join _ _ _ _ _ 894 2 1 h1 okB896
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 4 = true := blkChk_join _ _ _ _ _ 894 3 1 h2 okB897
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 5 = true := blkChk_join _ _ _ _ _ 894 4 1 h3 okB898
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 6 = true := blkChk_join _ _ _ _ _ 894 5 1 h4 okB899
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 7 = true := blkChk_join _ _ _ _ _ 894 6 1 h5 okB900
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 8 = true := blkChk_join _ _ _ _ _ 894 7 1 h6 okB901
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 9 = true := blkChk_join _ _ _ _ _ 894 8 1 h7 okB902
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 10 = true := blkChk_join _ _ _ _ _ 894 9 1 h8 okB903
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 11 = true := blkChk_join _ _ _ _ _ 894 10 1 h9 okB904
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 12 = true := blkChk_join _ _ _ _ _ 894 11 1 h10 okB905
  have h12 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 894 13 = true := blkChk_join _ _ _ _ _ 894 12 1 h11 okB906
  exact h12
end E1.C236X
