module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1566 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1566 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1567 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1567 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1568 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1568 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1569 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1569 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1570 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1570 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1571 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1571 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1572 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1572 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1573 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1573 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG171 : glueChkR lits W 1566 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1566 lenT]; decide +kernel
theorem okM171 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1566 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1566 1 = true := okB1566
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1566 2 = true := blkChk_join _ _ _ _ _ 1566 1 1 h0 okB1567
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1566 3 = true := blkChk_join _ _ _ _ _ 1566 2 1 h1 okB1568
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1566 4 = true := blkChk_join _ _ _ _ _ 1566 3 1 h2 okB1569
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1566 5 = true := blkChk_join _ _ _ _ _ 1566 4 1 h3 okB1570
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1566 6 = true := blkChk_join _ _ _ _ _ 1566 5 1 h4 okB1571
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1566 7 = true := blkChk_join _ _ _ _ _ 1566 6 1 h5 okB1572
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1566 8 = true := blkChk_join _ _ _ _ _ 1566 7 1 h6 okB1573
  exact h7
end E1.C284X
