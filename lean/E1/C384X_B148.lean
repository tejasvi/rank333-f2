module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1597 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 1 = true := by decide +kernel
theorem okB1598 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1598 1 = true := by decide +kernel
theorem okB1599 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1599 1 = true := by decide +kernel
theorem okB1600 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1600 1 = true := by decide +kernel
theorem okB1601 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1601 1 = true := by decide +kernel
theorem okB1602 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1602 1 = true := by decide +kernel
theorem okB1603 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1603 1 = true := by decide +kernel
theorem okB1604 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1604 1 = true := by decide +kernel
theorem okB1605 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1605 1 = true := by decide +kernel
theorem okB1606 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1606 1 = true := by decide +kernel
theorem okG148 : glueChkR lits W 1597 10 = true := by decide +kernel
theorem okM148 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 1 = true := okB1597
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 2 = true := blkChk_join _ _ _ _ _ 1597 1 1 h0 okB1598
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 3 = true := blkChk_join _ _ _ _ _ 1597 2 1 h1 okB1599
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 4 = true := blkChk_join _ _ _ _ _ 1597 3 1 h2 okB1600
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 5 = true := blkChk_join _ _ _ _ _ 1597 4 1 h3 okB1601
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 6 = true := blkChk_join _ _ _ _ _ 1597 5 1 h4 okB1602
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 7 = true := blkChk_join _ _ _ _ _ 1597 6 1 h5 okB1603
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 8 = true := blkChk_join _ _ _ _ _ 1597 7 1 h6 okB1604
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 9 = true := blkChk_join _ _ _ _ _ 1597 8 1 h7 okB1605
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1597 10 = true := blkChk_join _ _ _ _ _ 1597 9 1 h8 okB1606
  exact h9
end E1.C384X
