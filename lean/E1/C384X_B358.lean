module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3720 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 1 = true := by decide +kernel
theorem okB3721 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3721 1 = true := by decide +kernel
theorem okB3722 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3722 1 = true := by decide +kernel
theorem okB3723 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3723 1 = true := by decide +kernel
theorem okB3724 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3724 1 = true := by decide +kernel
theorem okB3725 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3725 1 = true := by decide +kernel
theorem okB3726 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3726 1 = true := by decide +kernel
theorem okB3727 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3727 1 = true := by decide +kernel
theorem okB3728 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3728 1 = true := by decide +kernel
theorem okB3729 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3729 1 = true := by decide +kernel
theorem okB3730 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3730 1 = true := by decide +kernel
theorem okB3731 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3731 1 = true := by decide +kernel
theorem okG358 : glueChkR lits W 3720 12 = true := by decide +kernel
theorem okM358 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 1 = true := okB3720
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 2 = true := blkChk_join _ _ _ _ _ 3720 1 1 h0 okB3721
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 3 = true := blkChk_join _ _ _ _ _ 3720 2 1 h1 okB3722
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 4 = true := blkChk_join _ _ _ _ _ 3720 3 1 h2 okB3723
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 5 = true := blkChk_join _ _ _ _ _ 3720 4 1 h3 okB3724
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 6 = true := blkChk_join _ _ _ _ _ 3720 5 1 h4 okB3725
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 7 = true := blkChk_join _ _ _ _ _ 3720 6 1 h5 okB3726
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 8 = true := blkChk_join _ _ _ _ _ 3720 7 1 h6 okB3727
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 9 = true := blkChk_join _ _ _ _ _ 3720 8 1 h7 okB3728
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 10 = true := blkChk_join _ _ _ _ _ 3720 9 1 h8 okB3729
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 11 = true := blkChk_join _ _ _ _ _ 3720 10 1 h9 okB3730
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3720 12 = true := blkChk_join _ _ _ _ _ 3720 11 1 h10 okB3731
  exact h11
end E1.C384X
