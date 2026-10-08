module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5537 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 1 = true := by decide +kernel
theorem okB5538 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5538 1 = true := by decide +kernel
theorem okB5539 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5539 1 = true := by decide +kernel
theorem okB5540 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5540 1 = true := by decide +kernel
theorem okB5541 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5541 1 = true := by decide +kernel
theorem okB5542 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5542 1 = true := by decide +kernel
theorem okB5543 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5543 1 = true := by decide +kernel
theorem okB5544 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5544 1 = true := by decide +kernel
theorem okB5545 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5545 1 = true := by decide +kernel
theorem okB5546 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5546 1 = true := by decide +kernel
theorem okG531 : glueChkR lits W 5537 10 = true := by decide +kernel
theorem okM531 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 1 = true := okB5537
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 2 = true := blkChk_join _ _ _ _ _ 5537 1 1 h0 okB5538
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 3 = true := blkChk_join _ _ _ _ _ 5537 2 1 h1 okB5539
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 4 = true := blkChk_join _ _ _ _ _ 5537 3 1 h2 okB5540
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 5 = true := blkChk_join _ _ _ _ _ 5537 4 1 h3 okB5541
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 6 = true := blkChk_join _ _ _ _ _ 5537 5 1 h4 okB5542
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 7 = true := blkChk_join _ _ _ _ _ 5537 6 1 h5 okB5543
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 8 = true := blkChk_join _ _ _ _ _ 5537 7 1 h6 okB5544
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 9 = true := blkChk_join _ _ _ _ _ 5537 8 1 h7 okB5545
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5537 10 = true := blkChk_join _ _ _ _ _ 5537 9 1 h8 okB5546
  exact h9
end E1.C384X
