module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB5306 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 1 = true := by decide +kernel
theorem okB5307 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5307 1 = true := by decide +kernel
theorem okB5308 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5308 1 = true := by decide +kernel
theorem okB5309 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5309 1 = true := by decide +kernel
theorem okB5310 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5310 1 = true := by decide +kernel
theorem okB5311 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5311 1 = true := by decide +kernel
theorem okB5312 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5312 1 = true := by decide +kernel
theorem okB5313 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5313 1 = true := by decide +kernel
theorem okB5314 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5314 1 = true := by decide +kernel
theorem okB5315 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5315 1 = true := by decide +kernel
theorem okB5316 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5316 1 = true := by decide +kernel
theorem okB5317 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5317 1 = true := by decide +kernel
theorem okB5318 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5318 1 = true := by decide +kernel
theorem okG485 : glueChkR lits W 5306 13 = true := by decide +kernel
theorem okM485 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 13 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 1 = true := okB5306
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 2 = true := blkChk_join _ _ _ _ _ 5306 1 1 h0 okB5307
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 3 = true := blkChk_join _ _ _ _ _ 5306 2 1 h1 okB5308
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 4 = true := blkChk_join _ _ _ _ _ 5306 3 1 h2 okB5309
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 5 = true := blkChk_join _ _ _ _ _ 5306 4 1 h3 okB5310
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 6 = true := blkChk_join _ _ _ _ _ 5306 5 1 h4 okB5311
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 7 = true := blkChk_join _ _ _ _ _ 5306 6 1 h5 okB5312
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 8 = true := blkChk_join _ _ _ _ _ 5306 7 1 h6 okB5313
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 9 = true := blkChk_join _ _ _ _ _ 5306 8 1 h7 okB5314
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 10 = true := blkChk_join _ _ _ _ _ 5306 9 1 h8 okB5315
  have h10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 11 = true := blkChk_join _ _ _ _ _ 5306 10 1 h9 okB5316
  have h11 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 12 = true := blkChk_join _ _ _ _ _ 5306 11 1 h10 okB5317
  have h12 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5306 13 = true := blkChk_join _ _ _ _ _ 5306 12 1 h11 okB5318
  exact h12
end E1.C213X
