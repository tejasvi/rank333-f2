module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3909 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 1 = true := by decide +kernel
theorem okB3910 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3910 1 = true := by decide +kernel
theorem okB3911 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3911 1 = true := by decide +kernel
theorem okB3912 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3912 1 = true := by decide +kernel
theorem okB3913 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3913 1 = true := by decide +kernel
theorem okB3914 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3914 1 = true := by decide +kernel
theorem okB3915 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3915 1 = true := by decide +kernel
theorem okB3916 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3916 1 = true := by decide +kernel
theorem okB3917 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3917 1 = true := by decide +kernel
theorem okB3918 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3918 1 = true := by decide +kernel
theorem okB3919 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3919 1 = true := by decide +kernel
theorem okG375 : glueChkR lits W 3909 11 = true := by decide +kernel
theorem okM375 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 1 = true := okB3909
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 2 = true := blkChk_join _ _ _ _ _ 3909 1 1 h0 okB3910
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 3 = true := blkChk_join _ _ _ _ _ 3909 2 1 h1 okB3911
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 4 = true := blkChk_join _ _ _ _ _ 3909 3 1 h2 okB3912
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 5 = true := blkChk_join _ _ _ _ _ 3909 4 1 h3 okB3913
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 6 = true := blkChk_join _ _ _ _ _ 3909 5 1 h4 okB3914
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 7 = true := blkChk_join _ _ _ _ _ 3909 6 1 h5 okB3915
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 8 = true := blkChk_join _ _ _ _ _ 3909 7 1 h6 okB3916
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 9 = true := blkChk_join _ _ _ _ _ 3909 8 1 h7 okB3917
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 10 = true := blkChk_join _ _ _ _ _ 3909 9 1 h8 okB3918
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3909 11 = true := blkChk_join _ _ _ _ _ 3909 10 1 h9 okB3919
  exact h10
end E1.C384X
