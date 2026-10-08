module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3531 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 1 = true := by decide +kernel
theorem okB3532 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3532 1 = true := by decide +kernel
theorem okB3533 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3533 1 = true := by decide +kernel
theorem okB3534 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3534 1 = true := by decide +kernel
theorem okB3535 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3535 1 = true := by decide +kernel
theorem okB3536 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3536 1 = true := by decide +kernel
theorem okB3537 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3537 1 = true := by decide +kernel
theorem okB3538 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3538 1 = true := by decide +kernel
theorem okB3539 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3539 1 = true := by decide +kernel
theorem okB3540 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3540 1 = true := by decide +kernel
theorem okG340 : glueChkR lits W 3531 10 = true := by decide +kernel
theorem okM340 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 1 = true := okB3531
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 2 = true := blkChk_join _ _ _ _ _ 3531 1 1 h0 okB3532
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 3 = true := blkChk_join _ _ _ _ _ 3531 2 1 h1 okB3533
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 4 = true := blkChk_join _ _ _ _ _ 3531 3 1 h2 okB3534
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 5 = true := blkChk_join _ _ _ _ _ 3531 4 1 h3 okB3535
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 6 = true := blkChk_join _ _ _ _ _ 3531 5 1 h4 okB3536
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 7 = true := blkChk_join _ _ _ _ _ 3531 6 1 h5 okB3537
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 8 = true := blkChk_join _ _ _ _ _ 3531 7 1 h6 okB3538
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 9 = true := blkChk_join _ _ _ _ _ 3531 8 1 h7 okB3539
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3531 10 = true := blkChk_join _ _ _ _ _ 3531 9 1 h8 okB3540
  exact h9
end E1.C384X
