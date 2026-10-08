module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5307 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 1 = true := by decide +kernel
theorem okB5308 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5308 1 = true := by decide +kernel
theorem okB5309 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5309 1 = true := by decide +kernel
theorem okB5310 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5310 1 = true := by decide +kernel
theorem okB5311 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5311 1 = true := by decide +kernel
theorem okB5312 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5312 1 = true := by decide +kernel
theorem okB5313 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5313 1 = true := by decide +kernel
theorem okB5314 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5314 1 = true := by decide +kernel
theorem okB5315 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5315 1 = true := by decide +kernel
theorem okB5316 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5316 1 = true := by decide +kernel
theorem okB5317 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5317 1 = true := by decide +kernel
theorem okB5318 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5318 1 = true := by decide +kernel
theorem okG508 : glueChkR lits W 5307 12 = true := by decide +kernel
theorem okM508 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 1 = true := okB5307
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 2 = true := blkChk_join _ _ _ _ _ 5307 1 1 h0 okB5308
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 3 = true := blkChk_join _ _ _ _ _ 5307 2 1 h1 okB5309
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 4 = true := blkChk_join _ _ _ _ _ 5307 3 1 h2 okB5310
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 5 = true := blkChk_join _ _ _ _ _ 5307 4 1 h3 okB5311
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 6 = true := blkChk_join _ _ _ _ _ 5307 5 1 h4 okB5312
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 7 = true := blkChk_join _ _ _ _ _ 5307 6 1 h5 okB5313
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 8 = true := blkChk_join _ _ _ _ _ 5307 7 1 h6 okB5314
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 9 = true := blkChk_join _ _ _ _ _ 5307 8 1 h7 okB5315
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 10 = true := blkChk_join _ _ _ _ _ 5307 9 1 h8 okB5316
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 11 = true := blkChk_join _ _ _ _ _ 5307 10 1 h9 okB5317
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5307 12 = true := blkChk_join _ _ _ _ _ 5307 11 1 h10 okB5318
  exact h11
end E1.C384X
