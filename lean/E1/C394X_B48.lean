module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB485 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 1 = true := by decide +kernel
theorem okB486 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 486 1 = true := by decide +kernel
theorem okB487 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 487 1 = true := by decide +kernel
theorem okB488 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 488 1 = true := by decide +kernel
theorem okB489 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 489 1 = true := by decide +kernel
theorem okB490 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 490 1 = true := by decide +kernel
theorem okB491 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 491 1 = true := by decide +kernel
theorem okB492 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 492 1 = true := by decide +kernel
theorem okB493 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 493 1 = true := by decide +kernel
theorem okB494 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 494 1 = true := by decide +kernel
theorem okG48 : glueChkR lits W 485 10 = true := by decide +kernel
theorem okM48 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 10 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 1 = true := okB485
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 2 = true := blkChk_join _ _ _ _ _ 485 1 1 h0 okB486
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 3 = true := blkChk_join _ _ _ _ _ 485 2 1 h1 okB487
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 4 = true := blkChk_join _ _ _ _ _ 485 3 1 h2 okB488
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 5 = true := blkChk_join _ _ _ _ _ 485 4 1 h3 okB489
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 6 = true := blkChk_join _ _ _ _ _ 485 5 1 h4 okB490
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 7 = true := blkChk_join _ _ _ _ _ 485 6 1 h5 okB491
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 8 = true := blkChk_join _ _ _ _ _ 485 7 1 h6 okB492
  have h8 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 9 = true := blkChk_join _ _ _ _ _ 485 8 1 h7 okB493
  have h9 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 485 10 = true := blkChk_join _ _ _ _ _ 485 9 1 h8 okB494
  exact h9
end E1.C394X
