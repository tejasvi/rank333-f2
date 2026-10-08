module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4479 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 1 = true := by decide +kernel
theorem okB4480 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4480 1 = true := by decide +kernel
theorem okB4481 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4481 1 = true := by decide +kernel
theorem okB4482 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4482 1 = true := by decide +kernel
theorem okB4483 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4483 1 = true := by decide +kernel
theorem okB4484 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4484 1 = true := by decide +kernel
theorem okB4485 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4485 1 = true := by decide +kernel
theorem okB4486 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4486 1 = true := by decide +kernel
theorem okB4487 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4487 1 = true := by decide +kernel
theorem okB4488 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4488 1 = true := by decide +kernel
theorem okB4489 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4489 1 = true := by decide +kernel
theorem okG428 : glueChkR lits W 4479 11 = true := by decide +kernel
theorem okM428 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 1 = true := okB4479
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 2 = true := blkChk_join _ _ _ _ _ 4479 1 1 h0 okB4480
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 3 = true := blkChk_join _ _ _ _ _ 4479 2 1 h1 okB4481
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 4 = true := blkChk_join _ _ _ _ _ 4479 3 1 h2 okB4482
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 5 = true := blkChk_join _ _ _ _ _ 4479 4 1 h3 okB4483
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 6 = true := blkChk_join _ _ _ _ _ 4479 5 1 h4 okB4484
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 7 = true := blkChk_join _ _ _ _ _ 4479 6 1 h5 okB4485
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 8 = true := blkChk_join _ _ _ _ _ 4479 7 1 h6 okB4486
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 9 = true := blkChk_join _ _ _ _ _ 4479 8 1 h7 okB4487
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 10 = true := blkChk_join _ _ _ _ _ 4479 9 1 h8 okB4488
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4479 11 = true := blkChk_join _ _ _ _ _ 4479 10 1 h9 okB4489
  exact h10
end E1.C384X
