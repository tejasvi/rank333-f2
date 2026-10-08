module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1553 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1554 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1554 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1555 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1555 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1556 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1556 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1557 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1557 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1558 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1558 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1559 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1559 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1560 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1560 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1561 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1561 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1562 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1562 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1563 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1563 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1564 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1564 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1565 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1565 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG170 : glueChkR lits W 1553 13 = true := by
  rw [← glueChkRN_eq lits W 7747 1553 lenT]; decide +kernel
theorem okM170 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 1 = true := okB1553
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 2 = true := blkChk_join _ _ _ _ _ 1553 1 1 h0 okB1554
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 3 = true := blkChk_join _ _ _ _ _ 1553 2 1 h1 okB1555
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 4 = true := blkChk_join _ _ _ _ _ 1553 3 1 h2 okB1556
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 5 = true := blkChk_join _ _ _ _ _ 1553 4 1 h3 okB1557
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 6 = true := blkChk_join _ _ _ _ _ 1553 5 1 h4 okB1558
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 7 = true := blkChk_join _ _ _ _ _ 1553 6 1 h5 okB1559
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 8 = true := blkChk_join _ _ _ _ _ 1553 7 1 h6 okB1560
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 9 = true := blkChk_join _ _ _ _ _ 1553 8 1 h7 okB1561
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 10 = true := blkChk_join _ _ _ _ _ 1553 9 1 h8 okB1562
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 11 = true := blkChk_join _ _ _ _ _ 1553 10 1 h9 okB1563
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 12 = true := blkChk_join _ _ _ _ _ 1553 11 1 h10 okB1564
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1553 13 = true := blkChk_join _ _ _ _ _ 1553 12 1 h11 okB1565
  exact h12
end E1.C284X
