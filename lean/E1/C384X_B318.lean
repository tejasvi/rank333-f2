module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3324 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 1 = true := by decide +kernel
theorem okB3325 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3325 1 = true := by decide +kernel
theorem okB3326 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3326 1 = true := by decide +kernel
theorem okB3327 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3327 1 = true := by decide +kernel
theorem okB3328 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3328 1 = true := by decide +kernel
theorem okB3329 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3329 1 = true := by decide +kernel
theorem okB3330 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3330 1 = true := by decide +kernel
theorem okB3331 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3331 1 = true := by decide +kernel
theorem okB3332 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3332 1 = true := by decide +kernel
theorem okB3333 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3333 1 = true := by decide +kernel
theorem okB3334 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3334 1 = true := by decide +kernel
theorem okG318 : glueChkR lits W 3324 11 = true := by decide +kernel
theorem okM318 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 1 = true := okB3324
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 2 = true := blkChk_join _ _ _ _ _ 3324 1 1 h0 okB3325
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 3 = true := blkChk_join _ _ _ _ _ 3324 2 1 h1 okB3326
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 4 = true := blkChk_join _ _ _ _ _ 3324 3 1 h2 okB3327
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 5 = true := blkChk_join _ _ _ _ _ 3324 4 1 h3 okB3328
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 6 = true := blkChk_join _ _ _ _ _ 3324 5 1 h4 okB3329
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 7 = true := blkChk_join _ _ _ _ _ 3324 6 1 h5 okB3330
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 8 = true := blkChk_join _ _ _ _ _ 3324 7 1 h6 okB3331
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 9 = true := blkChk_join _ _ _ _ _ 3324 8 1 h7 okB3332
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 10 = true := blkChk_join _ _ _ _ _ 3324 9 1 h8 okB3333
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3324 11 = true := blkChk_join _ _ _ _ _ 3324 10 1 h9 okB3334
  exact h10
end E1.C384X
