module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5486 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 1 = true := by decide +kernel
theorem okB5487 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5487 1 = true := by decide +kernel
theorem okB5488 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5488 1 = true := by decide +kernel
theorem okB5489 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5489 1 = true := by decide +kernel
theorem okB5490 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5490 1 = true := by decide +kernel
theorem okB5491 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5491 1 = true := by decide +kernel
theorem okB5492 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5492 1 = true := by decide +kernel
theorem okB5493 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5493 1 = true := by decide +kernel
theorem okB5494 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5494 1 = true := by decide +kernel
theorem okG526 : glueChkR lits W 5486 9 = true := by decide +kernel
theorem okM526 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 1 = true := okB5486
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 2 = true := blkChk_join _ _ _ _ _ 5486 1 1 h0 okB5487
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 3 = true := blkChk_join _ _ _ _ _ 5486 2 1 h1 okB5488
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 4 = true := blkChk_join _ _ _ _ _ 5486 3 1 h2 okB5489
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 5 = true := blkChk_join _ _ _ _ _ 5486 4 1 h3 okB5490
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 6 = true := blkChk_join _ _ _ _ _ 5486 5 1 h4 okB5491
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 7 = true := blkChk_join _ _ _ _ _ 5486 6 1 h5 okB5492
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 8 = true := blkChk_join _ _ _ _ _ 5486 7 1 h6 okB5493
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5486 9 = true := blkChk_join _ _ _ _ _ 5486 8 1 h7 okB5494
  exact h8
end E1.C384X
