module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1604 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1605 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1605 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1606 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1606 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1607 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1607 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1608 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1608 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1609 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1609 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1610 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1610 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1611 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1611 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1612 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1612 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG174 : glueChkR lits W 1604 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1604 lenT]; decide +kernel
theorem okM174 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 1 = true := okB1604
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 2 = true := blkChk_join _ _ _ _ _ 1604 1 1 h0 okB1605
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 3 = true := blkChk_join _ _ _ _ _ 1604 2 1 h1 okB1606
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 4 = true := blkChk_join _ _ _ _ _ 1604 3 1 h2 okB1607
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 5 = true := blkChk_join _ _ _ _ _ 1604 4 1 h3 okB1608
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 6 = true := blkChk_join _ _ _ _ _ 1604 5 1 h4 okB1609
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 7 = true := blkChk_join _ _ _ _ _ 1604 6 1 h5 okB1610
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 8 = true := blkChk_join _ _ _ _ _ 1604 7 1 h6 okB1611
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1604 9 = true := blkChk_join _ _ _ _ _ 1604 8 1 h7 okB1612
  exact h8
end E1.C284X
