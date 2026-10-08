module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2974 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2975 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2975 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2976 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2977 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2977 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2978 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2978 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2979 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2979 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2980 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2981 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2981 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2982 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2982 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2983 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2983 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2984 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2984 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG322 : glueChkR lits W 2974 11 = true := by
  rw [← glueChkRN_eq lits W 7747 2974 lenT]; decide +kernel
theorem okM322 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 1 = true := okB2974
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 2 = true := blkChk_join _ _ _ _ _ 2974 1 1 h0 okB2975
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 3 = true := blkChk_join _ _ _ _ _ 2974 2 1 h1 okB2976
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 4 = true := blkChk_join _ _ _ _ _ 2974 3 1 h2 okB2977
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 5 = true := blkChk_join _ _ _ _ _ 2974 4 1 h3 okB2978
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 6 = true := blkChk_join _ _ _ _ _ 2974 5 1 h4 okB2979
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 7 = true := blkChk_join _ _ _ _ _ 2974 6 1 h5 okB2980
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 8 = true := blkChk_join _ _ _ _ _ 2974 7 1 h6 okB2981
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 9 = true := blkChk_join _ _ _ _ _ 2974 8 1 h7 okB2982
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 10 = true := blkChk_join _ _ _ _ _ 2974 9 1 h8 okB2983
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2974 11 = true := blkChk_join _ _ _ _ _ 2974 10 1 h9 okB2984
  exact h10
end E1.C284X
