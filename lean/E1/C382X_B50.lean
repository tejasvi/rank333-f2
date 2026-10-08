module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB558 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 558 1 = true := by decide +kernel
theorem okB559 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 559 1 = true := by decide +kernel
theorem okB560 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 560 1 = true := by decide +kernel
theorem okB561 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 561 1 = true := by decide +kernel
theorem okB562 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 562 1 = true := by decide +kernel
theorem okB563 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 563 1 = true := by decide +kernel
theorem okB564 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 564 1 = true := by decide +kernel
theorem okB565 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 565 1 = true := by decide +kernel
theorem okG50 : glueChkR lits W 558 8 = true := by decide +kernel
theorem okM50 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 558 8 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 558 1 = true := okB558
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 558 2 = true := blkChk_join _ _ _ _ _ 558 1 1 h0 okB559
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 558 3 = true := blkChk_join _ _ _ _ _ 558 2 1 h1 okB560
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 558 4 = true := blkChk_join _ _ _ _ _ 558 3 1 h2 okB561
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 558 5 = true := blkChk_join _ _ _ _ _ 558 4 1 h3 okB562
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 558 6 = true := blkChk_join _ _ _ _ _ 558 5 1 h4 okB563
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 558 7 = true := blkChk_join _ _ _ _ _ 558 6 1 h5 okB564
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 558 8 = true := blkChk_join _ _ _ _ _ 558 7 1 h6 okB565
  exact h7
end E1.C382X
