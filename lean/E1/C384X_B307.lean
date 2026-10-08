module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3229 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3229 1 = true := by decide +kernel
theorem okB3230 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3230 1 = true := by decide +kernel
theorem okB3231 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3231 1 = true := by decide +kernel
theorem okB3232 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3232 1 = true := by decide +kernel
theorem okB3233 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3233 1 = true := by decide +kernel
theorem okB3234 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3234 1 = true := by decide +kernel
theorem okB3235 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3235 1 = true := by decide +kernel
theorem okG307 : glueChkR lits W 3229 7 = true := by decide +kernel
theorem okM307 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3229 7 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3229 1 = true := okB3229
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3229 2 = true := blkChk_join _ _ _ _ _ 3229 1 1 h0 okB3230
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3229 3 = true := blkChk_join _ _ _ _ _ 3229 2 1 h1 okB3231
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3229 4 = true := blkChk_join _ _ _ _ _ 3229 3 1 h2 okB3232
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3229 5 = true := blkChk_join _ _ _ _ _ 3229 4 1 h3 okB3233
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3229 6 = true := blkChk_join _ _ _ _ _ 3229 5 1 h4 okB3234
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3229 7 = true := blkChk_join _ _ _ _ _ 3229 6 1 h5 okB3235
  exact h6
end E1.C384X
