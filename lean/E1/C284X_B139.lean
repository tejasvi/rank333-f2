module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1261 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1262 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1262 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1263 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1263 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1264 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1264 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1265 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1265 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1266 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1266 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1267 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1267 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1268 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1268 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1269 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1269 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG139 : glueChkR lits W 1261 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1261 lenT]; decide +kernel
theorem okM139 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 1 = true := okB1261
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 2 = true := blkChk_join _ _ _ _ _ 1261 1 1 h0 okB1262
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 3 = true := blkChk_join _ _ _ _ _ 1261 2 1 h1 okB1263
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 4 = true := blkChk_join _ _ _ _ _ 1261 3 1 h2 okB1264
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 5 = true := blkChk_join _ _ _ _ _ 1261 4 1 h3 okB1265
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 6 = true := blkChk_join _ _ _ _ _ 1261 5 1 h4 okB1266
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 7 = true := blkChk_join _ _ _ _ _ 1261 6 1 h5 okB1267
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 8 = true := blkChk_join _ _ _ _ _ 1261 7 1 h6 okB1268
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1261 9 = true := blkChk_join _ _ _ _ _ 1261 8 1 h7 okB1269
  exact h8
end E1.C284X
