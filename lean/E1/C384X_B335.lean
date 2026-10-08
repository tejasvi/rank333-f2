module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3480 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 1 = true := by decide +kernel
theorem okB3481 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3481 1 = true := by decide +kernel
theorem okB3482 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3482 1 = true := by decide +kernel
theorem okB3483 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3483 1 = true := by decide +kernel
theorem okB3484 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3484 1 = true := by decide +kernel
theorem okB3485 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3485 1 = true := by decide +kernel
theorem okB3486 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3486 1 = true := by decide +kernel
theorem okB3487 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3487 1 = true := by decide +kernel
theorem okB3488 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3488 1 = true := by decide +kernel
theorem okG335 : glueChkR lits W 3480 9 = true := by decide +kernel
theorem okM335 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 1 = true := okB3480
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 2 = true := blkChk_join _ _ _ _ _ 3480 1 1 h0 okB3481
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 3 = true := blkChk_join _ _ _ _ _ 3480 2 1 h1 okB3482
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 4 = true := blkChk_join _ _ _ _ _ 3480 3 1 h2 okB3483
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 5 = true := blkChk_join _ _ _ _ _ 3480 4 1 h3 okB3484
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 6 = true := blkChk_join _ _ _ _ _ 3480 5 1 h4 okB3485
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 7 = true := blkChk_join _ _ _ _ _ 3480 6 1 h5 okB3486
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 8 = true := blkChk_join _ _ _ _ _ 3480 7 1 h6 okB3487
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3480 9 = true := blkChk_join _ _ _ _ _ 3480 8 1 h7 okB3488
  exact h8
end E1.C384X
