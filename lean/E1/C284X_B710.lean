module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6902 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6903 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6903 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6904 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6904 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6905 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6905 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6906 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6906 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6907 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6907 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6908 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6908 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6909 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6909 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6910 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6910 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6911 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6911 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6912 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6912 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6913 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6913 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6914 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6914 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG710 : glueChkR lits W 6902 13 = true := by
  rw [← glueChkRN_eq lits W 7747 6902 lenT]; decide +kernel
theorem okM710 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 1 = true := okB6902
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 2 = true := blkChk_join _ _ _ _ _ 6902 1 1 h0 okB6903
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 3 = true := blkChk_join _ _ _ _ _ 6902 2 1 h1 okB6904
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 4 = true := blkChk_join _ _ _ _ _ 6902 3 1 h2 okB6905
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 5 = true := blkChk_join _ _ _ _ _ 6902 4 1 h3 okB6906
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 6 = true := blkChk_join _ _ _ _ _ 6902 5 1 h4 okB6907
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 7 = true := blkChk_join _ _ _ _ _ 6902 6 1 h5 okB6908
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 8 = true := blkChk_join _ _ _ _ _ 6902 7 1 h6 okB6909
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 9 = true := blkChk_join _ _ _ _ _ 6902 8 1 h7 okB6910
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 10 = true := blkChk_join _ _ _ _ _ 6902 9 1 h8 okB6911
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 11 = true := blkChk_join _ _ _ _ _ 6902 10 1 h9 okB6912
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 12 = true := blkChk_join _ _ _ _ _ 6902 11 1 h10 okB6913
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6902 13 = true := blkChk_join _ _ _ _ _ 6902 12 1 h11 okB6914
  exact h12
end E1.C284X
