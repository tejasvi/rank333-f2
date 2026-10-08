module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1557 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 1 = true := by decide +kernel
theorem okB1558 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1558 1 = true := by decide +kernel
theorem okB1559 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1559 1 = true := by decide +kernel
theorem okB1560 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1560 1 = true := by decide +kernel
theorem okB1561 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1561 1 = true := by decide +kernel
theorem okB1562 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1562 1 = true := by decide +kernel
theorem okB1563 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1563 1 = true := by decide +kernel
theorem okB1564 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1564 1 = true := by decide +kernel
theorem okB1565 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1565 1 = true := by decide +kernel
theorem okB1566 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1566 1 = true := by decide +kernel
theorem okB1567 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1567 1 = true := by decide +kernel
theorem okG144 : glueChkR lits W 1557 11 = true := by decide +kernel
theorem okM144 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 1 = true := okB1557
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 2 = true := blkChk_join _ _ _ _ _ 1557 1 1 h0 okB1558
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 3 = true := blkChk_join _ _ _ _ _ 1557 2 1 h1 okB1559
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 4 = true := blkChk_join _ _ _ _ _ 1557 3 1 h2 okB1560
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 5 = true := blkChk_join _ _ _ _ _ 1557 4 1 h3 okB1561
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 6 = true := blkChk_join _ _ _ _ _ 1557 5 1 h4 okB1562
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 7 = true := blkChk_join _ _ _ _ _ 1557 6 1 h5 okB1563
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 8 = true := blkChk_join _ _ _ _ _ 1557 7 1 h6 okB1564
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 9 = true := blkChk_join _ _ _ _ _ 1557 8 1 h7 okB1565
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 10 = true := blkChk_join _ _ _ _ _ 1557 9 1 h8 okB1566
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1557 11 = true := blkChk_join _ _ _ _ _ 1557 10 1 h9 okB1567
  exact h10
end E1.C384X
