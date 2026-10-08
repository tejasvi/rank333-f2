module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1134 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1135 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1135 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1136 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1136 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1137 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1137 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1138 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1138 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1139 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1139 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1140 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1140 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1141 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1141 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1142 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1142 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1143 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1143 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1144 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1144 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1145 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1145 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG123 : glueChkR lits W 1134 12 = true := by
  rw [← glueChkRN_eq lits W 7747 1134 lenT]; decide +kernel
theorem okM123 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 1 = true := okB1134
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 2 = true := blkChk_join _ _ _ _ _ 1134 1 1 h0 okB1135
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 3 = true := blkChk_join _ _ _ _ _ 1134 2 1 h1 okB1136
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 4 = true := blkChk_join _ _ _ _ _ 1134 3 1 h2 okB1137
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 5 = true := blkChk_join _ _ _ _ _ 1134 4 1 h3 okB1138
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 6 = true := blkChk_join _ _ _ _ _ 1134 5 1 h4 okB1139
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 7 = true := blkChk_join _ _ _ _ _ 1134 6 1 h5 okB1140
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 8 = true := blkChk_join _ _ _ _ _ 1134 7 1 h6 okB1141
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 9 = true := blkChk_join _ _ _ _ _ 1134 8 1 h7 okB1142
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 10 = true := blkChk_join _ _ _ _ _ 1134 9 1 h8 okB1143
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 11 = true := blkChk_join _ _ _ _ _ 1134 10 1 h9 okB1144
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1134 12 = true := blkChk_join _ _ _ _ _ 1134 11 1 h10 okB1145
  exact h11
end E1.C284X
