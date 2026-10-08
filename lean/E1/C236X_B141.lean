module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1525 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1525 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1526 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1526 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1527 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1527 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1528 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1528 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1529 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1529 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1530 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1530 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1531 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1531 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG141 : glueChkR lits W 1525 7 = true := by
  rw [← glueChkRN_eq lits W 8596 1525 lenT]; decide +kernel
theorem okM141 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1525 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1525 1 = true := okB1525
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1525 2 = true := blkChk_join _ _ _ _ _ 1525 1 1 h0 okB1526
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1525 3 = true := blkChk_join _ _ _ _ _ 1525 2 1 h1 okB1527
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1525 4 = true := blkChk_join _ _ _ _ _ 1525 3 1 h2 okB1528
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1525 5 = true := blkChk_join _ _ _ _ _ 1525 4 1 h3 okB1529
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1525 6 = true := blkChk_join _ _ _ _ _ 1525 5 1 h4 okB1530
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1525 7 = true := blkChk_join _ _ _ _ _ 1525 6 1 h5 okB1531
  exact h6
end E1.C236X
