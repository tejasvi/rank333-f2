module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6541 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 1 = true := by decide +kernel
theorem okB6542 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6542 1 = true := by decide +kernel
theorem okB6543 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6543 1 = true := by decide +kernel
theorem okB6544 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6544 1 = true := by decide +kernel
theorem okB6545 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6545 1 = true := by decide +kernel
theorem okB6546 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6546 1 = true := by decide +kernel
theorem okB6547 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6547 1 = true := by decide +kernel
theorem okB6548 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6548 1 = true := by decide +kernel
theorem okB6549 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6549 1 = true := by decide +kernel
theorem okB6550 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6550 1 = true := by decide +kernel
theorem okG633 : glueChkR lits W 6541 10 = true := by decide +kernel
theorem okM633 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 1 = true := okB6541
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 2 = true := blkChk_join _ _ _ _ _ 6541 1 1 h0 okB6542
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 3 = true := blkChk_join _ _ _ _ _ 6541 2 1 h1 okB6543
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 4 = true := blkChk_join _ _ _ _ _ 6541 3 1 h2 okB6544
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 5 = true := blkChk_join _ _ _ _ _ 6541 4 1 h3 okB6545
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 6 = true := blkChk_join _ _ _ _ _ 6541 5 1 h4 okB6546
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 7 = true := blkChk_join _ _ _ _ _ 6541 6 1 h5 okB6547
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 8 = true := blkChk_join _ _ _ _ _ 6541 7 1 h6 okB6548
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 9 = true := blkChk_join _ _ _ _ _ 6541 8 1 h7 okB6549
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6541 10 = true := blkChk_join _ _ _ _ _ 6541 9 1 h8 okB6550
  exact h9
end E1.C384X
