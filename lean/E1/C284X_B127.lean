module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1170 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1170 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1171 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1171 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1172 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1172 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1173 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1173 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1174 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1174 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1175 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1175 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1176 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1176 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1177 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1177 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG127 : glueChkR lits W 1170 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1170 lenT]; decide +kernel
theorem okM127 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1170 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1170 1 = true := okB1170
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1170 2 = true := blkChk_join _ _ _ _ _ 1170 1 1 h0 okB1171
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1170 3 = true := blkChk_join _ _ _ _ _ 1170 2 1 h1 okB1172
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1170 4 = true := blkChk_join _ _ _ _ _ 1170 3 1 h2 okB1173
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1170 5 = true := blkChk_join _ _ _ _ _ 1170 4 1 h3 okB1174
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1170 6 = true := blkChk_join _ _ _ _ _ 1170 5 1 h4 okB1175
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1170 7 = true := blkChk_join _ _ _ _ _ 1170 6 1 h5 okB1176
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1170 8 = true := blkChk_join _ _ _ _ _ 1170 7 1 h6 okB1177
  exact h7
end E1.C284X
