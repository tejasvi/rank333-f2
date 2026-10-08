module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1036 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1037 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1037 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1038 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1038 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1039 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1039 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1040 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1040 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1041 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1041 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1042 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1042 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1043 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1043 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1044 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1044 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1045 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1045 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1046 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1046 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1047 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1047 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG98 : glueChkR lits W 1036 12 = true := by
  rw [← glueChkRN_eq lits W 8596 1036 lenT]; decide +kernel
theorem okM98 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 1 = true := okB1036
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 2 = true := blkChk_join _ _ _ _ _ 1036 1 1 h0 okB1037
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 3 = true := blkChk_join _ _ _ _ _ 1036 2 1 h1 okB1038
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 4 = true := blkChk_join _ _ _ _ _ 1036 3 1 h2 okB1039
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 5 = true := blkChk_join _ _ _ _ _ 1036 4 1 h3 okB1040
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 6 = true := blkChk_join _ _ _ _ _ 1036 5 1 h4 okB1041
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 7 = true := blkChk_join _ _ _ _ _ 1036 6 1 h5 okB1042
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 8 = true := blkChk_join _ _ _ _ _ 1036 7 1 h6 okB1043
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 9 = true := blkChk_join _ _ _ _ _ 1036 8 1 h7 okB1044
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 10 = true := blkChk_join _ _ _ _ _ 1036 9 1 h8 okB1045
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 11 = true := blkChk_join _ _ _ _ _ 1036 10 1 h9 okB1046
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1036 12 = true := blkChk_join _ _ _ _ _ 1036 11 1 h10 okB1047
  exact h11
end E1.C236X
