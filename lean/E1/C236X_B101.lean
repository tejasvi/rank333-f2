module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1068 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1069 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1070 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1071 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1072 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1073 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1074 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1075 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1076 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1077 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1077 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG101 : glueChkR lits W 1068 10 = true := by
  rw [← glueChkRN_eq lits W 8596 1068 lenT]; decide +kernel
theorem okM101 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 1 = true := okB1068
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 2 = true := blkChk_join _ _ _ _ _ 1068 1 1 h0 okB1069
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 3 = true := blkChk_join _ _ _ _ _ 1068 2 1 h1 okB1070
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 4 = true := blkChk_join _ _ _ _ _ 1068 3 1 h2 okB1071
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 5 = true := blkChk_join _ _ _ _ _ 1068 4 1 h3 okB1072
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 6 = true := blkChk_join _ _ _ _ _ 1068 5 1 h4 okB1073
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 7 = true := blkChk_join _ _ _ _ _ 1068 6 1 h5 okB1074
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 8 = true := blkChk_join _ _ _ _ _ 1068 7 1 h6 okB1075
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 9 = true := blkChk_join _ _ _ _ _ 1068 8 1 h7 okB1076
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1068 10 = true := blkChk_join _ _ _ _ _ 1068 9 1 h8 okB1077
  exact h9
end E1.C236X
