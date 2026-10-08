module
public import R22Port.U_d41d8cd98f00
public import E1.C267X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C267X
open E1S
theorem okB486 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 1 = true := by decide +kernel
theorem okB487 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 487 1 = true := by decide +kernel
theorem okB488 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 488 1 = true := by decide +kernel
theorem okB489 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 489 1 = true := by decide +kernel
theorem okB490 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 490 1 = true := by decide +kernel
theorem okB491 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 491 1 = true := by decide +kernel
theorem okB492 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 492 1 = true := by decide +kernel
theorem okB493 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 493 1 = true := by decide +kernel
theorem okB494 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 494 1 = true := by decide +kernel
theorem okB495 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 495 1 = true := by decide +kernel
theorem okG42 : glueChkR lits W 486 10 = true := by decide +kernel
theorem okM42 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 10 = true := by
  have h0 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 1 = true := okB486
  have h1 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 2 = true := blkChk_join _ _ _ _ _ 486 1 1 h0 okB487
  have h2 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 3 = true := blkChk_join _ _ _ _ _ 486 2 1 h1 okB488
  have h3 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 4 = true := blkChk_join _ _ _ _ _ 486 3 1 h2 okB489
  have h4 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 5 = true := blkChk_join _ _ _ _ _ 486 4 1 h3 okB490
  have h5 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 6 = true := blkChk_join _ _ _ _ _ 486 5 1 h4 okB491
  have h6 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 7 = true := blkChk_join _ _ _ _ _ 486 6 1 h5 okB492
  have h7 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 8 = true := blkChk_join _ _ _ _ _ 486 7 1 h6 okB493
  have h8 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 9 = true := blkChk_join _ _ _ _ _ 486 8 1 h7 okB494
  have h9 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 486 10 = true := blkChk_join _ _ _ _ _ 486 9 1 h8 okB495
  exact h9
end E1.C267X
