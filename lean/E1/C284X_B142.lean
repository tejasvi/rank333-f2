module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1292 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1293 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1293 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1294 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1294 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1295 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1295 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1296 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1296 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1297 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1297 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1298 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1298 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1299 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1299 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1300 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1300 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1301 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1301 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1302 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1302 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG142 : glueChkR lits W 1292 11 = true := by
  rw [← glueChkRN_eq lits W 7747 1292 lenT]; decide +kernel
theorem okM142 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 1 = true := okB1292
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 2 = true := blkChk_join _ _ _ _ _ 1292 1 1 h0 okB1293
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 3 = true := blkChk_join _ _ _ _ _ 1292 2 1 h1 okB1294
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 4 = true := blkChk_join _ _ _ _ _ 1292 3 1 h2 okB1295
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 5 = true := blkChk_join _ _ _ _ _ 1292 4 1 h3 okB1296
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 6 = true := blkChk_join _ _ _ _ _ 1292 5 1 h4 okB1297
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 7 = true := blkChk_join _ _ _ _ _ 1292 6 1 h5 okB1298
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 8 = true := blkChk_join _ _ _ _ _ 1292 7 1 h6 okB1299
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 9 = true := blkChk_join _ _ _ _ _ 1292 8 1 h7 okB1300
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 10 = true := blkChk_join _ _ _ _ _ 1292 9 1 h8 okB1301
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1292 11 = true := blkChk_join _ _ _ _ _ 1292 10 1 h9 okB1302
  exact h10
end E1.C284X
