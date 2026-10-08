module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1570 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1570 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1571 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1571 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1572 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1572 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1573 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1573 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1574 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1574 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1575 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1575 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1576 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1576 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1577 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1577 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG147 : glueChkR lits W 1570 8 = true := by
  rw [← glueChkRN_eq lits W 8596 1570 lenT]; decide +kernel
theorem okM147 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1570 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1570 1 = true := okB1570
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1570 2 = true := blkChk_join _ _ _ _ _ 1570 1 1 h0 okB1571
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1570 3 = true := blkChk_join _ _ _ _ _ 1570 2 1 h1 okB1572
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1570 4 = true := blkChk_join _ _ _ _ _ 1570 3 1 h2 okB1573
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1570 5 = true := blkChk_join _ _ _ _ _ 1570 4 1 h3 okB1574
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1570 6 = true := blkChk_join _ _ _ _ _ 1570 5 1 h4 okB1575
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1570 7 = true := blkChk_join _ _ _ _ _ 1570 6 1 h5 okB1576
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1570 8 = true := blkChk_join _ _ _ _ _ 1570 7 1 h6 okB1577
  exact h7
end E1.C236X
