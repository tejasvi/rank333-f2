module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB575 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 1 = true := by decide +kernel
theorem okB576 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 576 1 = true := by decide +kernel
theorem okB577 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 577 1 = true := by decide +kernel
theorem okB578 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 578 1 = true := by decide +kernel
theorem okB579 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 579 1 = true := by decide +kernel
theorem okB580 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 580 1 = true := by decide +kernel
theorem okB581 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 581 1 = true := by decide +kernel
theorem okB582 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 582 1 = true := by decide +kernel
theorem okB583 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 583 1 = true := by decide +kernel
theorem okG52 : glueChkR lits W 575 9 = true := by decide +kernel
theorem okM52 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 1 = true := okB575
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 2 = true := blkChk_join _ _ _ _ _ 575 1 1 h0 okB576
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 3 = true := blkChk_join _ _ _ _ _ 575 2 1 h1 okB577
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 4 = true := blkChk_join _ _ _ _ _ 575 3 1 h2 okB578
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 5 = true := blkChk_join _ _ _ _ _ 575 4 1 h3 okB579
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 6 = true := blkChk_join _ _ _ _ _ 575 5 1 h4 okB580
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 7 = true := blkChk_join _ _ _ _ _ 575 6 1 h5 okB581
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 8 = true := blkChk_join _ _ _ _ _ 575 7 1 h6 okB582
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 575 9 = true := blkChk_join _ _ _ _ _ 575 8 1 h7 okB583
  exact h8
end E1.C382X
