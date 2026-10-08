module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2567 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 1 = true := by decide +kernel
theorem okB2568 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2568 1 = true := by decide +kernel
theorem okB2569 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2569 1 = true := by decide +kernel
theorem okB2570 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2570 1 = true := by decide +kernel
theorem okB2571 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2571 1 = true := by decide +kernel
theorem okB2572 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2572 1 = true := by decide +kernel
theorem okB2573 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2573 1 = true := by decide +kernel
theorem okB2574 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2574 1 = true := by decide +kernel
theorem okB2575 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2575 1 = true := by decide +kernel
theorem okB2576 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2576 1 = true := by decide +kernel
theorem okB2577 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2577 1 = true := by decide +kernel
theorem okB2578 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2578 1 = true := by decide +kernel
theorem okB2579 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2579 1 = true := by decide +kernel
theorem okG241 : glueChkR lits W 2567 13 = true := by decide +kernel
theorem okM241 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 13 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 1 = true := okB2567
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 2 = true := blkChk_join _ _ _ _ _ 2567 1 1 h0 okB2568
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 3 = true := blkChk_join _ _ _ _ _ 2567 2 1 h1 okB2569
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 4 = true := blkChk_join _ _ _ _ _ 2567 3 1 h2 okB2570
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 5 = true := blkChk_join _ _ _ _ _ 2567 4 1 h3 okB2571
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 6 = true := blkChk_join _ _ _ _ _ 2567 5 1 h4 okB2572
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 7 = true := blkChk_join _ _ _ _ _ 2567 6 1 h5 okB2573
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 8 = true := blkChk_join _ _ _ _ _ 2567 7 1 h6 okB2574
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 9 = true := blkChk_join _ _ _ _ _ 2567 8 1 h7 okB2575
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 10 = true := blkChk_join _ _ _ _ _ 2567 9 1 h8 okB2576
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 11 = true := blkChk_join _ _ _ _ _ 2567 10 1 h9 okB2577
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 12 = true := blkChk_join _ _ _ _ _ 2567 11 1 h10 okB2578
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2567 13 = true := blkChk_join _ _ _ _ _ 2567 12 1 h11 okB2579
  exact h12
end E1.C384X
