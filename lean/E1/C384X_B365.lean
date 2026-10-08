module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3802 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 1 = true := by decide +kernel
theorem okB3803 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3803 1 = true := by decide +kernel
theorem okB3804 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3804 1 = true := by decide +kernel
theorem okB3805 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3805 1 = true := by decide +kernel
theorem okB3806 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3806 1 = true := by decide +kernel
theorem okB3807 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3807 1 = true := by decide +kernel
theorem okB3808 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3808 1 = true := by decide +kernel
theorem okB3809 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3809 1 = true := by decide +kernel
theorem okB3810 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3810 1 = true := by decide +kernel
theorem okB3811 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3811 1 = true := by decide +kernel
theorem okB3812 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3812 1 = true := by decide +kernel
theorem okG365 : glueChkR lits W 3802 11 = true := by decide +kernel
theorem okM365 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 1 = true := okB3802
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 2 = true := blkChk_join _ _ _ _ _ 3802 1 1 h0 okB3803
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 3 = true := blkChk_join _ _ _ _ _ 3802 2 1 h1 okB3804
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 4 = true := blkChk_join _ _ _ _ _ 3802 3 1 h2 okB3805
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 5 = true := blkChk_join _ _ _ _ _ 3802 4 1 h3 okB3806
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 6 = true := blkChk_join _ _ _ _ _ 3802 5 1 h4 okB3807
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 7 = true := blkChk_join _ _ _ _ _ 3802 6 1 h5 okB3808
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 8 = true := blkChk_join _ _ _ _ _ 3802 7 1 h6 okB3809
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 9 = true := blkChk_join _ _ _ _ _ 3802 8 1 h7 okB3810
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 10 = true := blkChk_join _ _ _ _ _ 3802 9 1 h8 okB3811
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3802 11 = true := blkChk_join _ _ _ _ _ 3802 10 1 h9 okB3812
  exact h10
end E1.C384X
