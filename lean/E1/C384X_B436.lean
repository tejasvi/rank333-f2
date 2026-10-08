module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4567 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 1 = true := by decide +kernel
theorem okB4568 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4568 1 = true := by decide +kernel
theorem okB4569 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4569 1 = true := by decide +kernel
theorem okB4570 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4570 1 = true := by decide +kernel
theorem okB4571 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4571 1 = true := by decide +kernel
theorem okB4572 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4572 1 = true := by decide +kernel
theorem okB4573 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4573 1 = true := by decide +kernel
theorem okB4574 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4574 1 = true := by decide +kernel
theorem okB4575 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4575 1 = true := by decide +kernel
theorem okB4576 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4576 1 = true := by decide +kernel
theorem okB4577 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4577 1 = true := by decide +kernel
theorem okG436 : glueChkR lits W 4567 11 = true := by decide +kernel
theorem okM436 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 1 = true := okB4567
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 2 = true := blkChk_join _ _ _ _ _ 4567 1 1 h0 okB4568
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 3 = true := blkChk_join _ _ _ _ _ 4567 2 1 h1 okB4569
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 4 = true := blkChk_join _ _ _ _ _ 4567 3 1 h2 okB4570
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 5 = true := blkChk_join _ _ _ _ _ 4567 4 1 h3 okB4571
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 6 = true := blkChk_join _ _ _ _ _ 4567 5 1 h4 okB4572
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 7 = true := blkChk_join _ _ _ _ _ 4567 6 1 h5 okB4573
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 8 = true := blkChk_join _ _ _ _ _ 4567 7 1 h6 okB4574
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 9 = true := blkChk_join _ _ _ _ _ 4567 8 1 h7 okB4575
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 10 = true := blkChk_join _ _ _ _ _ 4567 9 1 h8 okB4576
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4567 11 = true := blkChk_join _ _ _ _ _ 4567 10 1 h9 okB4577
  exact h10
end E1.C384X
