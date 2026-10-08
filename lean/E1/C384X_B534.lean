module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5567 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 1 = true := by decide +kernel
theorem okB5568 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5568 1 = true := by decide +kernel
theorem okB5569 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5569 1 = true := by decide +kernel
theorem okB5570 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5570 1 = true := by decide +kernel
theorem okB5571 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5571 1 = true := by decide +kernel
theorem okB5572 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5572 1 = true := by decide +kernel
theorem okB5573 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5573 1 = true := by decide +kernel
theorem okB5574 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5574 1 = true := by decide +kernel
theorem okB5575 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5575 1 = true := by decide +kernel
theorem okB5576 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5576 1 = true := by decide +kernel
theorem okG534 : glueChkR lits W 5567 10 = true := by decide +kernel
theorem okM534 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 1 = true := okB5567
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 2 = true := blkChk_join _ _ _ _ _ 5567 1 1 h0 okB5568
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 3 = true := blkChk_join _ _ _ _ _ 5567 2 1 h1 okB5569
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 4 = true := blkChk_join _ _ _ _ _ 5567 3 1 h2 okB5570
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 5 = true := blkChk_join _ _ _ _ _ 5567 4 1 h3 okB5571
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 6 = true := blkChk_join _ _ _ _ _ 5567 5 1 h4 okB5572
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 7 = true := blkChk_join _ _ _ _ _ 5567 6 1 h5 okB5573
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 8 = true := blkChk_join _ _ _ _ _ 5567 7 1 h6 okB5574
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 9 = true := blkChk_join _ _ _ _ _ 5567 8 1 h7 okB5575
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5567 10 = true := blkChk_join _ _ _ _ _ 5567 9 1 h8 okB5576
  exact h9
end E1.C384X
