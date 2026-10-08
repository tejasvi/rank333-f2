module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4589 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 1 = true := by decide +kernel
theorem okB4590 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4590 1 = true := by decide +kernel
theorem okB4591 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4591 1 = true := by decide +kernel
theorem okB4592 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4592 1 = true := by decide +kernel
theorem okB4593 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4593 1 = true := by decide +kernel
theorem okB4594 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4594 1 = true := by decide +kernel
theorem okB4595 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4595 1 = true := by decide +kernel
theorem okB4596 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4596 1 = true := by decide +kernel
theorem okB4597 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4597 1 = true := by decide +kernel
theorem okG438 : glueChkR lits W 4589 9 = true := by decide +kernel
theorem okM438 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 1 = true := okB4589
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 2 = true := blkChk_join _ _ _ _ _ 4589 1 1 h0 okB4590
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 3 = true := blkChk_join _ _ _ _ _ 4589 2 1 h1 okB4591
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 4 = true := blkChk_join _ _ _ _ _ 4589 3 1 h2 okB4592
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 5 = true := blkChk_join _ _ _ _ _ 4589 4 1 h3 okB4593
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 6 = true := blkChk_join _ _ _ _ _ 4589 5 1 h4 okB4594
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 7 = true := blkChk_join _ _ _ _ _ 4589 6 1 h5 okB4595
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 8 = true := blkChk_join _ _ _ _ _ 4589 7 1 h6 okB4596
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4589 9 = true := blkChk_join _ _ _ _ _ 4589 8 1 h7 okB4597
  exact h8
end E1.C384X
