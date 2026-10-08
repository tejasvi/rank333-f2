module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1377 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1378 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1378 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1379 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1379 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1380 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1380 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1381 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1381 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1382 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1382 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1383 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1383 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1384 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1384 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1385 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1385 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1386 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1386 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG151 : glueChkR lits W 1377 10 = true := by
  rw [← glueChkRN_eq lits W 7747 1377 lenT]; decide +kernel
theorem okM151 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 1 = true := okB1377
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 2 = true := blkChk_join _ _ _ _ _ 1377 1 1 h0 okB1378
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 3 = true := blkChk_join _ _ _ _ _ 1377 2 1 h1 okB1379
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 4 = true := blkChk_join _ _ _ _ _ 1377 3 1 h2 okB1380
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 5 = true := blkChk_join _ _ _ _ _ 1377 4 1 h3 okB1381
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 6 = true := blkChk_join _ _ _ _ _ 1377 5 1 h4 okB1382
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 7 = true := blkChk_join _ _ _ _ _ 1377 6 1 h5 okB1383
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 8 = true := blkChk_join _ _ _ _ _ 1377 7 1 h6 okB1384
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 9 = true := blkChk_join _ _ _ _ _ 1377 8 1 h7 okB1385
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1377 10 = true := blkChk_join _ _ _ _ _ 1377 9 1 h8 okB1386
  exact h9
end E1.C284X
