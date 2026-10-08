module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5319 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 1 = true := by decide +kernel
theorem okB5320 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5320 1 = true := by decide +kernel
theorem okB5321 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5321 1 = true := by decide +kernel
theorem okB5322 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5322 1 = true := by decide +kernel
theorem okB5323 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5323 1 = true := by decide +kernel
theorem okB5324 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5324 1 = true := by decide +kernel
theorem okB5325 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5325 1 = true := by decide +kernel
theorem okB5326 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5326 1 = true := by decide +kernel
theorem okB5327 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5327 1 = true := by decide +kernel
theorem okG509 : glueChkR lits W 5319 9 = true := by decide +kernel
theorem okM509 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 1 = true := okB5319
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 2 = true := blkChk_join _ _ _ _ _ 5319 1 1 h0 okB5320
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 3 = true := blkChk_join _ _ _ _ _ 5319 2 1 h1 okB5321
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 4 = true := blkChk_join _ _ _ _ _ 5319 3 1 h2 okB5322
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 5 = true := blkChk_join _ _ _ _ _ 5319 4 1 h3 okB5323
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 6 = true := blkChk_join _ _ _ _ _ 5319 5 1 h4 okB5324
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 7 = true := blkChk_join _ _ _ _ _ 5319 6 1 h5 okB5325
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 8 = true := blkChk_join _ _ _ _ _ 5319 7 1 h6 okB5326
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5319 9 = true := blkChk_join _ _ _ _ _ 5319 8 1 h7 okB5327
  exact h8
end E1.C384X
