module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB573 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 1 = true := by decide +kernel
theorem okB574 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 574 1 = true := by decide +kernel
theorem okB575 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 575 1 = true := by decide +kernel
theorem okB576 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 576 1 = true := by decide +kernel
theorem okB577 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 577 1 = true := by decide +kernel
theorem okB578 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 578 1 = true := by decide +kernel
theorem okB579 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 579 1 = true := by decide +kernel
theorem okB580 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 580 1 = true := by decide +kernel
theorem okB581 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 581 1 = true := by decide +kernel
theorem okB582 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 582 1 = true := by decide +kernel
theorem okG56 : glueChkR lits W 573 10 = true := by decide +kernel
theorem okM56 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 1 = true := okB573
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 2 = true := blkChk_join _ _ _ _ _ 573 1 1 h0 okB574
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 3 = true := blkChk_join _ _ _ _ _ 573 2 1 h1 okB575
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 4 = true := blkChk_join _ _ _ _ _ 573 3 1 h2 okB576
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 5 = true := blkChk_join _ _ _ _ _ 573 4 1 h3 okB577
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 6 = true := blkChk_join _ _ _ _ _ 573 5 1 h4 okB578
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 7 = true := blkChk_join _ _ _ _ _ 573 6 1 h5 okB579
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 8 = true := blkChk_join _ _ _ _ _ 573 7 1 h6 okB580
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 9 = true := blkChk_join _ _ _ _ _ 573 8 1 h7 okB581
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 573 10 = true := blkChk_join _ _ _ _ _ 573 9 1 h8 okB582
  exact h9
end E1.C384X
