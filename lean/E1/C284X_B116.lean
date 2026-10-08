module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1070 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1071 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1072 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1073 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1074 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1075 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1076 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1077 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1077 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG116 : glueChkR lits W 1070 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1070 lenT]; decide +kernel
theorem okM116 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1070 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1070 1 = true := okB1070
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1070 2 = true := blkChk_join _ _ _ _ _ 1070 1 1 h0 okB1071
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1070 3 = true := blkChk_join _ _ _ _ _ 1070 2 1 h1 okB1072
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1070 4 = true := blkChk_join _ _ _ _ _ 1070 3 1 h2 okB1073
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1070 5 = true := blkChk_join _ _ _ _ _ 1070 4 1 h3 okB1074
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1070 6 = true := blkChk_join _ _ _ _ _ 1070 5 1 h4 okB1075
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1070 7 = true := blkChk_join _ _ _ _ _ 1070 6 1 h5 okB1076
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1070 8 = true := blkChk_join _ _ _ _ _ 1070 7 1 h6 okB1077
  exact h7
end E1.C284X
