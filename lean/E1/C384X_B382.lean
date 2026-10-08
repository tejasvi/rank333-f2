module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3989 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 1 = true := by decide +kernel
theorem okB3990 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3990 1 = true := by decide +kernel
theorem okB3991 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3991 1 = true := by decide +kernel
theorem okB3992 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3992 1 = true := by decide +kernel
theorem okB3993 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3993 1 = true := by decide +kernel
theorem okB3994 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3994 1 = true := by decide +kernel
theorem okB3995 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3995 1 = true := by decide +kernel
theorem okB3996 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3996 1 = true := by decide +kernel
theorem okB3997 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3997 1 = true := by decide +kernel
theorem okB3998 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3998 1 = true := by decide +kernel
theorem okB3999 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3999 1 = true := by decide +kernel
theorem okB4000 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4000 1 = true := by decide +kernel
theorem okG382 : glueChkR lits W 3989 12 = true := by decide +kernel
theorem okM382 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 1 = true := okB3989
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 2 = true := blkChk_join _ _ _ _ _ 3989 1 1 h0 okB3990
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 3 = true := blkChk_join _ _ _ _ _ 3989 2 1 h1 okB3991
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 4 = true := blkChk_join _ _ _ _ _ 3989 3 1 h2 okB3992
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 5 = true := blkChk_join _ _ _ _ _ 3989 4 1 h3 okB3993
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 6 = true := blkChk_join _ _ _ _ _ 3989 5 1 h4 okB3994
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 7 = true := blkChk_join _ _ _ _ _ 3989 6 1 h5 okB3995
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 8 = true := blkChk_join _ _ _ _ _ 3989 7 1 h6 okB3996
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 9 = true := blkChk_join _ _ _ _ _ 3989 8 1 h7 okB3997
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 10 = true := blkChk_join _ _ _ _ _ 3989 9 1 h8 okB3998
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 11 = true := blkChk_join _ _ _ _ _ 3989 10 1 h9 okB3999
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3989 12 = true := blkChk_join _ _ _ _ _ 3989 11 1 h10 okB4000
  exact h11
end E1.C384X
