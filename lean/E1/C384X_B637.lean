module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6581 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6581 1 = true := by decide +kernel
theorem okB6582 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6582 1 = true := by decide +kernel
theorem okB6583 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6583 1 = true := by decide +kernel
theorem okB6584 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6584 1 = true := by decide +kernel
theorem okB6585 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6585 1 = true := by decide +kernel
theorem okB6586 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6586 1 = true := by decide +kernel
theorem okB6587 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6587 1 = true := by decide +kernel
theorem okB6588 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6588 1 = true := by decide +kernel
theorem okG637 : glueChkR lits W 6581 8 = true := by decide +kernel
theorem okM637 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6581 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6581 1 = true := okB6581
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6581 2 = true := blkChk_join _ _ _ _ _ 6581 1 1 h0 okB6582
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6581 3 = true := blkChk_join _ _ _ _ _ 6581 2 1 h1 okB6583
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6581 4 = true := blkChk_join _ _ _ _ _ 6581 3 1 h2 okB6584
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6581 5 = true := blkChk_join _ _ _ _ _ 6581 4 1 h3 okB6585
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6581 6 = true := blkChk_join _ _ _ _ _ 6581 5 1 h4 okB6586
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6581 7 = true := blkChk_join _ _ _ _ _ 6581 6 1 h5 okB6587
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6581 8 = true := blkChk_join _ _ _ _ _ 6581 7 1 h6 okB6588
  exact h7
end E1.C384X
