module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1567 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 1 = true := by decide +kernel
theorem okB1568 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1568 1 = true := by decide +kernel
theorem okB1569 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1569 1 = true := by decide +kernel
theorem okB1570 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1570 1 = true := by decide +kernel
theorem okB1571 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1571 1 = true := by decide +kernel
theorem okB1572 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1572 1 = true := by decide +kernel
theorem okB1573 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1573 1 = true := by decide +kernel
theorem okB1574 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1574 1 = true := by decide +kernel
theorem okB1575 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1575 1 = true := by decide +kernel
theorem okB1576 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1576 1 = true := by decide +kernel
theorem okB1577 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1577 1 = true := by decide +kernel
theorem okB1578 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1578 1 = true := by decide +kernel
theorem okG142 : glueChkR lits W 1567 12 = true := by decide +kernel
theorem okM142 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 12 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 1 = true := okB1567
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 2 = true := blkChk_join _ _ _ _ _ 1567 1 1 h0 okB1568
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 3 = true := blkChk_join _ _ _ _ _ 1567 2 1 h1 okB1569
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 4 = true := blkChk_join _ _ _ _ _ 1567 3 1 h2 okB1570
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 5 = true := blkChk_join _ _ _ _ _ 1567 4 1 h3 okB1571
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 6 = true := blkChk_join _ _ _ _ _ 1567 5 1 h4 okB1572
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 7 = true := blkChk_join _ _ _ _ _ 1567 6 1 h5 okB1573
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 8 = true := blkChk_join _ _ _ _ _ 1567 7 1 h6 okB1574
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 9 = true := blkChk_join _ _ _ _ _ 1567 8 1 h7 okB1575
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 10 = true := blkChk_join _ _ _ _ _ 1567 9 1 h8 okB1576
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 11 = true := blkChk_join _ _ _ _ _ 1567 10 1 h9 okB1577
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1567 12 = true := blkChk_join _ _ _ _ _ 1567 11 1 h10 okB1578
  exact h11
end E1.C382X
