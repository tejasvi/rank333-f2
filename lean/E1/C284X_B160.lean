module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1463 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1464 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1464 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1465 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1465 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1466 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1466 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1467 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1467 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1468 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1468 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1469 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1469 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1470 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1470 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1471 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1471 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1472 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1472 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG160 : glueChkR lits W 1463 10 = true := by
  rw [← glueChkRN_eq lits W 7747 1463 lenT]; decide +kernel
theorem okM160 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 1 = true := okB1463
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 2 = true := blkChk_join _ _ _ _ _ 1463 1 1 h0 okB1464
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 3 = true := blkChk_join _ _ _ _ _ 1463 2 1 h1 okB1465
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 4 = true := blkChk_join _ _ _ _ _ 1463 3 1 h2 okB1466
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 5 = true := blkChk_join _ _ _ _ _ 1463 4 1 h3 okB1467
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 6 = true := blkChk_join _ _ _ _ _ 1463 5 1 h4 okB1468
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 7 = true := blkChk_join _ _ _ _ _ 1463 6 1 h5 okB1469
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 8 = true := blkChk_join _ _ _ _ _ 1463 7 1 h6 okB1470
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 9 = true := blkChk_join _ _ _ _ _ 1463 8 1 h7 okB1471
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1463 10 = true := blkChk_join _ _ _ _ _ 1463 9 1 h8 okB1472
  exact h9
end E1.C284X
