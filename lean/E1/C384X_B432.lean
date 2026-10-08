module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4524 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 1 = true := by decide +kernel
theorem okB4525 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4525 1 = true := by decide +kernel
theorem okB4526 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4526 1 = true := by decide +kernel
theorem okB4527 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4527 1 = true := by decide +kernel
theorem okB4528 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4528 1 = true := by decide +kernel
theorem okB4529 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4529 1 = true := by decide +kernel
theorem okB4530 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4530 1 = true := by decide +kernel
theorem okB4531 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4531 1 = true := by decide +kernel
theorem okB4532 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4532 1 = true := by decide +kernel
theorem okB4533 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4533 1 = true := by decide +kernel
theorem okB4534 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4534 1 = true := by decide +kernel
theorem okG432 : glueChkR lits W 4524 11 = true := by decide +kernel
theorem okM432 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 1 = true := okB4524
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 2 = true := blkChk_join _ _ _ _ _ 4524 1 1 h0 okB4525
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 3 = true := blkChk_join _ _ _ _ _ 4524 2 1 h1 okB4526
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 4 = true := blkChk_join _ _ _ _ _ 4524 3 1 h2 okB4527
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 5 = true := blkChk_join _ _ _ _ _ 4524 4 1 h3 okB4528
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 6 = true := blkChk_join _ _ _ _ _ 4524 5 1 h4 okB4529
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 7 = true := blkChk_join _ _ _ _ _ 4524 6 1 h5 okB4530
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 8 = true := blkChk_join _ _ _ _ _ 4524 7 1 h6 okB4531
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 9 = true := blkChk_join _ _ _ _ _ 4524 8 1 h7 okB4532
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 10 = true := blkChk_join _ _ _ _ _ 4524 9 1 h8 okB4533
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4524 11 = true := blkChk_join _ _ _ _ _ 4524 10 1 h9 okB4534
  exact h10
end E1.C384X
