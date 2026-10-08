module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1545 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 1 = true := by decide +kernel
theorem okB1546 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1546 1 = true := by decide +kernel
theorem okB1547 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1547 1 = true := by decide +kernel
theorem okB1548 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1548 1 = true := by decide +kernel
theorem okB1549 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1549 1 = true := by decide +kernel
theorem okB1550 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1550 1 = true := by decide +kernel
theorem okB1551 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1551 1 = true := by decide +kernel
theorem okB1552 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1552 1 = true := by decide +kernel
theorem okB1553 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1553 1 = true := by decide +kernel
theorem okB1554 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1554 1 = true := by decide +kernel
theorem okB1555 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1555 1 = true := by decide +kernel
theorem okB1556 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1556 1 = true := by decide +kernel
theorem okG143 : glueChkR lits W 1545 12 = true := by decide +kernel
theorem okM143 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 1 = true := okB1545
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 2 = true := blkChk_join _ _ _ _ _ 1545 1 1 h0 okB1546
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 3 = true := blkChk_join _ _ _ _ _ 1545 2 1 h1 okB1547
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 4 = true := blkChk_join _ _ _ _ _ 1545 3 1 h2 okB1548
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 5 = true := blkChk_join _ _ _ _ _ 1545 4 1 h3 okB1549
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 6 = true := blkChk_join _ _ _ _ _ 1545 5 1 h4 okB1550
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 7 = true := blkChk_join _ _ _ _ _ 1545 6 1 h5 okB1551
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 8 = true := blkChk_join _ _ _ _ _ 1545 7 1 h6 okB1552
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 9 = true := blkChk_join _ _ _ _ _ 1545 8 1 h7 okB1553
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 10 = true := blkChk_join _ _ _ _ _ 1545 9 1 h8 okB1554
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 11 = true := blkChk_join _ _ _ _ _ 1545 10 1 h9 okB1555
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1545 12 = true := blkChk_join _ _ _ _ _ 1545 11 1 h10 okB1556
  exact h11
end E1.C384X
