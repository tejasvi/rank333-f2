module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB479 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 1 = true := by decide +kernel
theorem okB480 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 480 1 = true := by decide +kernel
theorem okB481 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 481 1 = true := by decide +kernel
theorem okB482 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 482 1 = true := by decide +kernel
theorem okB483 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 483 1 = true := by decide +kernel
theorem okB484 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 484 1 = true := by decide +kernel
theorem okB485 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 485 1 = true := by decide +kernel
theorem okB486 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 486 1 = true := by decide +kernel
theorem okB487 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 487 1 = true := by decide +kernel
theorem okB488 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 488 1 = true := by decide +kernel
theorem okG43 : glueChkR lits W 479 10 = true := by decide +kernel
theorem okM43 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 10 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 1 = true := okB479
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 2 = true := blkChk_join _ _ _ _ _ 479 1 1 h0 okB480
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 3 = true := blkChk_join _ _ _ _ _ 479 2 1 h1 okB481
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 4 = true := blkChk_join _ _ _ _ _ 479 3 1 h2 okB482
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 5 = true := blkChk_join _ _ _ _ _ 479 4 1 h3 okB483
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 6 = true := blkChk_join _ _ _ _ _ 479 5 1 h4 okB484
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 7 = true := blkChk_join _ _ _ _ _ 479 6 1 h5 okB485
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 8 = true := blkChk_join _ _ _ _ _ 479 7 1 h6 okB486
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 9 = true := blkChk_join _ _ _ _ _ 479 8 1 h7 okB487
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 479 10 = true := blkChk_join _ _ _ _ _ 479 9 1 h8 okB488
  exact h9
end E1.C387X
