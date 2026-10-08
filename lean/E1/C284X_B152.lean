module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1387 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1388 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1388 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1389 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1389 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1390 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1390 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1391 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1391 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1392 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1392 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1393 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1393 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1394 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1394 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1395 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1395 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1396 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1396 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG152 : glueChkR lits W 1387 10 = true := by
  rw [← glueChkRN_eq lits W 7747 1387 lenT]; decide +kernel
theorem okM152 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 1 = true := okB1387
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 2 = true := blkChk_join _ _ _ _ _ 1387 1 1 h0 okB1388
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 3 = true := blkChk_join _ _ _ _ _ 1387 2 1 h1 okB1389
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 4 = true := blkChk_join _ _ _ _ _ 1387 3 1 h2 okB1390
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 5 = true := blkChk_join _ _ _ _ _ 1387 4 1 h3 okB1391
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 6 = true := blkChk_join _ _ _ _ _ 1387 5 1 h4 okB1392
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 7 = true := blkChk_join _ _ _ _ _ 1387 6 1 h5 okB1393
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 8 = true := blkChk_join _ _ _ _ _ 1387 7 1 h6 okB1394
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 9 = true := blkChk_join _ _ _ _ _ 1387 8 1 h7 okB1395
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1387 10 = true := blkChk_join _ _ _ _ _ 1387 9 1 h8 okB1396
  exact h9
end E1.C284X
