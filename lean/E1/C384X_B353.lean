module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3667 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 1 = true := by decide +kernel
theorem okB3668 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3668 1 = true := by decide +kernel
theorem okB3669 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3669 1 = true := by decide +kernel
theorem okB3670 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3670 1 = true := by decide +kernel
theorem okB3671 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3671 1 = true := by decide +kernel
theorem okB3672 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3672 1 = true := by decide +kernel
theorem okB3673 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3673 1 = true := by decide +kernel
theorem okB3674 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3674 1 = true := by decide +kernel
theorem okB3675 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3675 1 = true := by decide +kernel
theorem okB3676 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3676 1 = true := by decide +kernel
theorem okG353 : glueChkR lits W 3667 10 = true := by decide +kernel
theorem okM353 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 1 = true := okB3667
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 2 = true := blkChk_join _ _ _ _ _ 3667 1 1 h0 okB3668
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 3 = true := blkChk_join _ _ _ _ _ 3667 2 1 h1 okB3669
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 4 = true := blkChk_join _ _ _ _ _ 3667 3 1 h2 okB3670
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 5 = true := blkChk_join _ _ _ _ _ 3667 4 1 h3 okB3671
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 6 = true := blkChk_join _ _ _ _ _ 3667 5 1 h4 okB3672
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 7 = true := blkChk_join _ _ _ _ _ 3667 6 1 h5 okB3673
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 8 = true := blkChk_join _ _ _ _ _ 3667 7 1 h6 okB3674
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 9 = true := blkChk_join _ _ _ _ _ 3667 8 1 h7 okB3675
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3667 10 = true := blkChk_join _ _ _ _ _ 3667 9 1 h8 okB3676
  exact h9
end E1.C384X
