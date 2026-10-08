module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1228 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1229 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1229 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1230 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1230 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1231 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1231 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1232 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1232 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1233 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1233 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1234 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1234 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1235 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1235 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1236 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1236 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG135 : glueChkR lits W 1228 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1228 lenT]; decide +kernel
theorem okM135 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 1 = true := okB1228
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 2 = true := blkChk_join _ _ _ _ _ 1228 1 1 h0 okB1229
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 3 = true := blkChk_join _ _ _ _ _ 1228 2 1 h1 okB1230
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 4 = true := blkChk_join _ _ _ _ _ 1228 3 1 h2 okB1231
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 5 = true := blkChk_join _ _ _ _ _ 1228 4 1 h3 okB1232
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 6 = true := blkChk_join _ _ _ _ _ 1228 5 1 h4 okB1233
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 7 = true := blkChk_join _ _ _ _ _ 1228 6 1 h5 okB1234
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 8 = true := blkChk_join _ _ _ _ _ 1228 7 1 h6 okB1235
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1228 9 = true := blkChk_join _ _ _ _ _ 1228 8 1 h7 okB1236
  exact h8
end E1.C284X
