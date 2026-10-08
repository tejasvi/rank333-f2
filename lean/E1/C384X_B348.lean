module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3606 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 1 = true := by decide +kernel
theorem okB3607 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3607 1 = true := by decide +kernel
theorem okB3608 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3608 1 = true := by decide +kernel
theorem okB3609 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3609 1 = true := by decide +kernel
theorem okB3610 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3610 1 = true := by decide +kernel
theorem okB3611 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3611 1 = true := by decide +kernel
theorem okB3612 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3612 1 = true := by decide +kernel
theorem okB3613 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3613 1 = true := by decide +kernel
theorem okB3614 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3614 1 = true := by decide +kernel
theorem okB3615 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3615 1 = true := by decide +kernel
theorem okB3616 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3616 1 = true := by decide +kernel
theorem okB3617 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3617 1 = true := by decide +kernel
theorem okG348 : glueChkR lits W 3606 12 = true := by decide +kernel
theorem okM348 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 1 = true := okB3606
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 2 = true := blkChk_join _ _ _ _ _ 3606 1 1 h0 okB3607
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 3 = true := blkChk_join _ _ _ _ _ 3606 2 1 h1 okB3608
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 4 = true := blkChk_join _ _ _ _ _ 3606 3 1 h2 okB3609
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 5 = true := blkChk_join _ _ _ _ _ 3606 4 1 h3 okB3610
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 6 = true := blkChk_join _ _ _ _ _ 3606 5 1 h4 okB3611
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 7 = true := blkChk_join _ _ _ _ _ 3606 6 1 h5 okB3612
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 8 = true := blkChk_join _ _ _ _ _ 3606 7 1 h6 okB3613
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 9 = true := blkChk_join _ _ _ _ _ 3606 8 1 h7 okB3614
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 10 = true := blkChk_join _ _ _ _ _ 3606 9 1 h8 okB3615
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 11 = true := blkChk_join _ _ _ _ _ 3606 10 1 h9 okB3616
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3606 12 = true := blkChk_join _ _ _ _ _ 3606 11 1 h10 okB3617
  exact h11
end E1.C384X
