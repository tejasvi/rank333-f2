module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4161 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4162 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4162 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4163 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4163 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4164 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4164 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4165 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4165 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4166 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4166 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4167 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4167 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4168 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4168 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4169 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4169 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG442 : glueChkR lits W 4161 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4161 lenT]; decide +kernel
theorem okM442 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 1 = true := okB4161
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 2 = true := blkChk_join _ _ _ _ _ 4161 1 1 h0 okB4162
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 3 = true := blkChk_join _ _ _ _ _ 4161 2 1 h1 okB4163
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 4 = true := blkChk_join _ _ _ _ _ 4161 3 1 h2 okB4164
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 5 = true := blkChk_join _ _ _ _ _ 4161 4 1 h3 okB4165
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 6 = true := blkChk_join _ _ _ _ _ 4161 5 1 h4 okB4166
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 7 = true := blkChk_join _ _ _ _ _ 4161 6 1 h5 okB4167
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 8 = true := blkChk_join _ _ _ _ _ 4161 7 1 h6 okB4168
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4161 9 = true := blkChk_join _ _ _ _ _ 4161 8 1 h7 okB4169
  exact h8
end E1.C284X
