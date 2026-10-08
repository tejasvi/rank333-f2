module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3554 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3554 1 = true := by decide +kernel
theorem okB3555 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3555 1 = true := by decide +kernel
theorem okB3556 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3556 1 = true := by decide +kernel
theorem okB3557 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3557 1 = true := by decide +kernel
theorem okB3558 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3558 1 = true := by decide +kernel
theorem okB3559 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3559 1 = true := by decide +kernel
theorem okB3560 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3560 1 = true := by decide +kernel
theorem okB3561 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3561 1 = true := by decide +kernel
theorem okG342 : glueChkR lits W 3554 8 = true := by decide +kernel
theorem okM342 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3554 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3554 1 = true := okB3554
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3554 2 = true := blkChk_join _ _ _ _ _ 3554 1 1 h0 okB3555
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3554 3 = true := blkChk_join _ _ _ _ _ 3554 2 1 h1 okB3556
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3554 4 = true := blkChk_join _ _ _ _ _ 3554 3 1 h2 okB3557
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3554 5 = true := blkChk_join _ _ _ _ _ 3554 4 1 h3 okB3558
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3554 6 = true := blkChk_join _ _ _ _ _ 3554 5 1 h4 okB3559
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3554 7 = true := blkChk_join _ _ _ _ _ 3554 6 1 h5 okB3560
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3554 8 = true := blkChk_join _ _ _ _ _ 3554 7 1 h6 okB3561
  exact h7
end E1.C384X
