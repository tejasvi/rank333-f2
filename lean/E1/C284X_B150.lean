module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1368 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1369 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1369 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1370 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1370 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1371 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1371 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1372 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1372 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1373 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1373 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1374 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1374 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1375 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1375 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1376 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1376 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG150 : glueChkR lits W 1368 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1368 lenT]; decide +kernel
theorem okM150 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 1 = true := okB1368
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 2 = true := blkChk_join _ _ _ _ _ 1368 1 1 h0 okB1369
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 3 = true := blkChk_join _ _ _ _ _ 1368 2 1 h1 okB1370
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 4 = true := blkChk_join _ _ _ _ _ 1368 3 1 h2 okB1371
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 5 = true := blkChk_join _ _ _ _ _ 1368 4 1 h3 okB1372
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 6 = true := blkChk_join _ _ _ _ _ 1368 5 1 h4 okB1373
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 7 = true := blkChk_join _ _ _ _ _ 1368 6 1 h5 okB1374
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 8 = true := blkChk_join _ _ _ _ _ 1368 7 1 h6 okB1375
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1368 9 = true := blkChk_join _ _ _ _ _ 1368 8 1 h7 okB1376
  exact h8
end E1.C284X
