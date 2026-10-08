module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1375 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1376 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1376 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1377 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1377 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1378 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1378 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1379 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1379 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1380 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1380 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1381 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1381 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1382 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1382 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1383 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1383 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG127 : glueChkR lits W 1375 9 = true := by
  rw [← glueChkRN_eq lits W 8596 1375 lenT]; decide +kernel
theorem okM127 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 1 = true := okB1375
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 2 = true := blkChk_join _ _ _ _ _ 1375 1 1 h0 okB1376
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 3 = true := blkChk_join _ _ _ _ _ 1375 2 1 h1 okB1377
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 4 = true := blkChk_join _ _ _ _ _ 1375 3 1 h2 okB1378
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 5 = true := blkChk_join _ _ _ _ _ 1375 4 1 h3 okB1379
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 6 = true := blkChk_join _ _ _ _ _ 1375 5 1 h4 okB1380
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 7 = true := blkChk_join _ _ _ _ _ 1375 6 1 h5 okB1381
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 8 = true := blkChk_join _ _ _ _ _ 1375 7 1 h6 okB1382
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1375 9 = true := blkChk_join _ _ _ _ _ 1375 8 1 h7 okB1383
  exact h8
end E1.C236X
