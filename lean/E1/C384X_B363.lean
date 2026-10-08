module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3782 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3782 1 = true := by decide +kernel
theorem okB3783 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3783 1 = true := by decide +kernel
theorem okB3784 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3784 1 = true := by decide +kernel
theorem okB3785 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3785 1 = true := by decide +kernel
theorem okB3786 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3786 1 = true := by decide +kernel
theorem okB3787 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3787 1 = true := by decide +kernel
theorem okB3788 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3788 1 = true := by decide +kernel
theorem okB3789 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3789 1 = true := by decide +kernel
theorem okG363 : glueChkR lits W 3782 8 = true := by decide +kernel
theorem okM363 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3782 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3782 1 = true := okB3782
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3782 2 = true := blkChk_join _ _ _ _ _ 3782 1 1 h0 okB3783
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3782 3 = true := blkChk_join _ _ _ _ _ 3782 2 1 h1 okB3784
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3782 4 = true := blkChk_join _ _ _ _ _ 3782 3 1 h2 okB3785
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3782 5 = true := blkChk_join _ _ _ _ _ 3782 4 1 h3 okB3786
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3782 6 = true := blkChk_join _ _ _ _ _ 3782 5 1 h4 okB3787
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3782 7 = true := blkChk_join _ _ _ _ _ 3782 6 1 h5 okB3788
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3782 8 = true := blkChk_join _ _ _ _ _ 3782 7 1 h6 okB3789
  exact h7
end E1.C384X
