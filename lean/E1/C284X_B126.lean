module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1163 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1163 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1164 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1164 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1165 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1165 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1166 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1166 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1167 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1167 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1168 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1168 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1169 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1169 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG126 : glueChkR lits W 1163 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1163 lenT]; decide +kernel
theorem okM126 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1163 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1163 1 = true := okB1163
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1163 2 = true := blkChk_join _ _ _ _ _ 1163 1 1 h0 okB1164
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1163 3 = true := blkChk_join _ _ _ _ _ 1163 2 1 h1 okB1165
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1163 4 = true := blkChk_join _ _ _ _ _ 1163 3 1 h2 okB1166
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1163 5 = true := blkChk_join _ _ _ _ _ 1163 4 1 h3 okB1167
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1163 6 = true := blkChk_join _ _ _ _ _ 1163 5 1 h4 okB1168
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1163 7 = true := blkChk_join _ _ _ _ _ 1163 6 1 h5 okB1169
  exact h6
end E1.C284X
