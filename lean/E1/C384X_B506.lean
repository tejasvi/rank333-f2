module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5288 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 1 = true := by decide +kernel
theorem okB5289 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5289 1 = true := by decide +kernel
theorem okB5290 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5290 1 = true := by decide +kernel
theorem okB5291 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5291 1 = true := by decide +kernel
theorem okB5292 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5292 1 = true := by decide +kernel
theorem okB5293 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5293 1 = true := by decide +kernel
theorem okB5294 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5294 1 = true := by decide +kernel
theorem okB5295 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5295 1 = true := by decide +kernel
theorem okB5296 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5296 1 = true := by decide +kernel
theorem okB5297 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5297 1 = true := by decide +kernel
theorem okG506 : glueChkR lits W 5288 10 = true := by decide +kernel
theorem okM506 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 1 = true := okB5288
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 2 = true := blkChk_join _ _ _ _ _ 5288 1 1 h0 okB5289
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 3 = true := blkChk_join _ _ _ _ _ 5288 2 1 h1 okB5290
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 4 = true := blkChk_join _ _ _ _ _ 5288 3 1 h2 okB5291
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 5 = true := blkChk_join _ _ _ _ _ 5288 4 1 h3 okB5292
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 6 = true := blkChk_join _ _ _ _ _ 5288 5 1 h4 okB5293
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 7 = true := blkChk_join _ _ _ _ _ 5288 6 1 h5 okB5294
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 8 = true := blkChk_join _ _ _ _ _ 5288 7 1 h6 okB5295
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 9 = true := blkChk_join _ _ _ _ _ 5288 8 1 h7 okB5296
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5288 10 = true := blkChk_join _ _ _ _ _ 5288 9 1 h8 okB5297
  exact h9
end E1.C384X
