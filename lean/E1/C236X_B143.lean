module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1540 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1541 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1541 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1542 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1542 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1543 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1543 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1544 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1544 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1545 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1545 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1546 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1546 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1547 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1547 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1548 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1548 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG143 : glueChkR lits W 1540 9 = true := by
  rw [← glueChkRN_eq lits W 8596 1540 lenT]; decide +kernel
theorem okM143 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 1 = true := okB1540
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 2 = true := blkChk_join _ _ _ _ _ 1540 1 1 h0 okB1541
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 3 = true := blkChk_join _ _ _ _ _ 1540 2 1 h1 okB1542
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 4 = true := blkChk_join _ _ _ _ _ 1540 3 1 h2 okB1543
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 5 = true := blkChk_join _ _ _ _ _ 1540 4 1 h3 okB1544
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 6 = true := blkChk_join _ _ _ _ _ 1540 5 1 h4 okB1545
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 7 = true := blkChk_join _ _ _ _ _ 1540 6 1 h5 okB1546
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 8 = true := blkChk_join _ _ _ _ _ 1540 7 1 h6 okB1547
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1540 9 = true := blkChk_join _ _ _ _ _ 1540 8 1 h7 okB1548
  exact h8
end E1.C236X
