module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1237 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1238 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1238 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1239 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1239 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1240 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1240 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1241 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1241 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1242 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1242 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1243 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1243 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1244 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1244 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1245 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1245 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1246 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1246 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1247 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1247 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG136 : glueChkR lits W 1237 11 = true := by
  rw [← glueChkRN_eq lits W 7747 1237 lenT]; decide +kernel
theorem okM136 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 1 = true := okB1237
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 2 = true := blkChk_join _ _ _ _ _ 1237 1 1 h0 okB1238
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 3 = true := blkChk_join _ _ _ _ _ 1237 2 1 h1 okB1239
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 4 = true := blkChk_join _ _ _ _ _ 1237 3 1 h2 okB1240
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 5 = true := blkChk_join _ _ _ _ _ 1237 4 1 h3 okB1241
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 6 = true := blkChk_join _ _ _ _ _ 1237 5 1 h4 okB1242
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 7 = true := blkChk_join _ _ _ _ _ 1237 6 1 h5 okB1243
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 8 = true := blkChk_join _ _ _ _ _ 1237 7 1 h6 okB1244
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 9 = true := blkChk_join _ _ _ _ _ 1237 8 1 h7 okB1245
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 10 = true := blkChk_join _ _ _ _ _ 1237 9 1 h8 okB1246
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1237 11 = true := blkChk_join _ _ _ _ _ 1237 10 1 h9 okB1247
  exact h10
end E1.C284X
