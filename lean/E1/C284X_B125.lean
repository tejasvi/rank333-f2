module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1156 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1156 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1157 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1157 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1158 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1158 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1159 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1159 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1160 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1160 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1161 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1161 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1162 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1162 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG125 : glueChkR lits W 1156 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1156 lenT]; decide +kernel
theorem okM125 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1156 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1156 1 = true := okB1156
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1156 2 = true := blkChk_join _ _ _ _ _ 1156 1 1 h0 okB1157
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1156 3 = true := blkChk_join _ _ _ _ _ 1156 2 1 h1 okB1158
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1156 4 = true := blkChk_join _ _ _ _ _ 1156 3 1 h2 okB1159
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1156 5 = true := blkChk_join _ _ _ _ _ 1156 4 1 h3 okB1160
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1156 6 = true := blkChk_join _ _ _ _ _ 1156 5 1 h4 okB1161
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1156 7 = true := blkChk_join _ _ _ _ _ 1156 6 1 h5 okB1162
  exact h6
end E1.C284X
