module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB967 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB968 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 968 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB969 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 969 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB970 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 970 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB971 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 971 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB972 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 972 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB973 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 973 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB974 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 974 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB975 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 975 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB976 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG102 : glueChkR lits W 967 10 = true := by
  rw [← glueChkRN_eq lits W 7747 967 lenT]; decide +kernel
theorem okM102 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 1 = true := okB967
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 2 = true := blkChk_join _ _ _ _ _ 967 1 1 h0 okB968
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 3 = true := blkChk_join _ _ _ _ _ 967 2 1 h1 okB969
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 4 = true := blkChk_join _ _ _ _ _ 967 3 1 h2 okB970
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 5 = true := blkChk_join _ _ _ _ _ 967 4 1 h3 okB971
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 6 = true := blkChk_join _ _ _ _ _ 967 5 1 h4 okB972
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 7 = true := blkChk_join _ _ _ _ _ 967 6 1 h5 okB973
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 8 = true := blkChk_join _ _ _ _ _ 967 7 1 h6 okB974
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 9 = true := blkChk_join _ _ _ _ _ 967 8 1 h7 okB975
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 967 10 = true := blkChk_join _ _ _ _ _ 967 9 1 h8 okB976
  exact h9
end E1.C284X
