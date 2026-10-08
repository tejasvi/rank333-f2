module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3583 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 1 = true := by decide +kernel
theorem okB3584 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3584 1 = true := by decide +kernel
theorem okB3585 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3585 1 = true := by decide +kernel
theorem okB3586 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3586 1 = true := by decide +kernel
theorem okB3587 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3587 1 = true := by decide +kernel
theorem okB3588 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3588 1 = true := by decide +kernel
theorem okB3589 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3589 1 = true := by decide +kernel
theorem okB3590 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3590 1 = true := by decide +kernel
theorem okB3591 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3591 1 = true := by decide +kernel
theorem okG346 : glueChkR lits W 3583 9 = true := by decide +kernel
theorem okM346 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 1 = true := okB3583
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 2 = true := blkChk_join _ _ _ _ _ 3583 1 1 h0 okB3584
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 3 = true := blkChk_join _ _ _ _ _ 3583 2 1 h1 okB3585
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 4 = true := blkChk_join _ _ _ _ _ 3583 3 1 h2 okB3586
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 5 = true := blkChk_join _ _ _ _ _ 3583 4 1 h3 okB3587
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 6 = true := blkChk_join _ _ _ _ _ 3583 5 1 h4 okB3588
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 7 = true := blkChk_join _ _ _ _ _ 3583 6 1 h5 okB3589
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 8 = true := blkChk_join _ _ _ _ _ 3583 7 1 h6 okB3590
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3583 9 = true := blkChk_join _ _ _ _ _ 3583 8 1 h7 okB3591
  exact h8
end E1.C384X
