module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4191 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4191 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4192 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4192 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4193 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4193 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4194 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4194 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4195 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4195 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4196 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4196 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4197 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4197 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG445 : glueChkR lits W 4191 7 = true := by
  rw [← glueChkRN_eq lits W 7747 4191 lenT]; decide +kernel
theorem okM445 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4191 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4191 1 = true := okB4191
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4191 2 = true := blkChk_join _ _ _ _ _ 4191 1 1 h0 okB4192
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4191 3 = true := blkChk_join _ _ _ _ _ 4191 2 1 h1 okB4193
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4191 4 = true := blkChk_join _ _ _ _ _ 4191 3 1 h2 okB4194
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4191 5 = true := blkChk_join _ _ _ _ _ 4191 4 1 h3 okB4195
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4191 6 = true := blkChk_join _ _ _ _ _ 4191 5 1 h4 okB4196
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4191 7 = true := blkChk_join _ _ _ _ _ 4191 6 1 h5 okB4197
  exact h6
end E1.C284X
