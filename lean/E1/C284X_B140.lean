module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1270 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1271 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1271 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1272 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1272 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1273 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1273 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1274 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1274 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1275 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1275 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1276 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1276 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1277 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1277 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1278 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1278 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1279 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1279 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1280 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1280 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1281 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1281 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG140 : glueChkR lits W 1270 12 = true := by
  rw [← glueChkRN_eq lits W 7747 1270 lenT]; decide +kernel
theorem okM140 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 1 = true := okB1270
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 2 = true := blkChk_join _ _ _ _ _ 1270 1 1 h0 okB1271
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 3 = true := blkChk_join _ _ _ _ _ 1270 2 1 h1 okB1272
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 4 = true := blkChk_join _ _ _ _ _ 1270 3 1 h2 okB1273
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 5 = true := blkChk_join _ _ _ _ _ 1270 4 1 h3 okB1274
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 6 = true := blkChk_join _ _ _ _ _ 1270 5 1 h4 okB1275
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 7 = true := blkChk_join _ _ _ _ _ 1270 6 1 h5 okB1276
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 8 = true := blkChk_join _ _ _ _ _ 1270 7 1 h6 okB1277
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 9 = true := blkChk_join _ _ _ _ _ 1270 8 1 h7 okB1278
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 10 = true := blkChk_join _ _ _ _ _ 1270 9 1 h8 okB1279
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 11 = true := blkChk_join _ _ _ _ _ 1270 10 1 h9 okB1280
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1270 12 = true := blkChk_join _ _ _ _ _ 1270 11 1 h10 okB1281
  exact h11
end E1.C284X
