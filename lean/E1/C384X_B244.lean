module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2603 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 1 = true := by decide +kernel
theorem okB2604 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2604 1 = true := by decide +kernel
theorem okB2605 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2605 1 = true := by decide +kernel
theorem okB2606 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2606 1 = true := by decide +kernel
theorem okB2607 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2607 1 = true := by decide +kernel
theorem okB2608 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2608 1 = true := by decide +kernel
theorem okB2609 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2609 1 = true := by decide +kernel
theorem okB2610 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2610 1 = true := by decide +kernel
theorem okB2611 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2611 1 = true := by decide +kernel
theorem okB2612 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2612 1 = true := by decide +kernel
theorem okG244 : glueChkR lits W 2603 10 = true := by decide +kernel
theorem okM244 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 1 = true := okB2603
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 2 = true := blkChk_join _ _ _ _ _ 2603 1 1 h0 okB2604
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 3 = true := blkChk_join _ _ _ _ _ 2603 2 1 h1 okB2605
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 4 = true := blkChk_join _ _ _ _ _ 2603 3 1 h2 okB2606
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 5 = true := blkChk_join _ _ _ _ _ 2603 4 1 h3 okB2607
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 6 = true := blkChk_join _ _ _ _ _ 2603 5 1 h4 okB2608
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 7 = true := blkChk_join _ _ _ _ _ 2603 6 1 h5 okB2609
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 8 = true := blkChk_join _ _ _ _ _ 2603 7 1 h6 okB2610
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 9 = true := blkChk_join _ _ _ _ _ 2603 8 1 h7 okB2611
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2603 10 = true := blkChk_join _ _ _ _ _ 2603 9 1 h8 okB2612
  exact h9
end E1.C384X
