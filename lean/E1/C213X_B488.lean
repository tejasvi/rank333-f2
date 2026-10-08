module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB5340 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 1 = true := by decide +kernel
theorem okB5341 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5341 1 = true := by decide +kernel
theorem okB5342 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5342 1 = true := by decide +kernel
theorem okB5343 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5343 1 = true := by decide +kernel
theorem okB5344 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5344 1 = true := by decide +kernel
theorem okB5345 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5345 1 = true := by decide +kernel
theorem okB5346 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5346 1 = true := by decide +kernel
theorem okB5347 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5347 1 = true := by decide +kernel
theorem okB5348 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5348 1 = true := by decide +kernel
theorem okB5349 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5349 1 = true := by decide +kernel
theorem okB5350 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5350 1 = true := by decide +kernel
theorem okB5351 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5351 1 = true := by decide +kernel
theorem okG488 : glueChkR lits W 5340 12 = true := by decide +kernel
theorem okM488 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 12 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 1 = true := okB5340
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 2 = true := blkChk_join _ _ _ _ _ 5340 1 1 h0 okB5341
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 3 = true := blkChk_join _ _ _ _ _ 5340 2 1 h1 okB5342
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 4 = true := blkChk_join _ _ _ _ _ 5340 3 1 h2 okB5343
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 5 = true := blkChk_join _ _ _ _ _ 5340 4 1 h3 okB5344
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 6 = true := blkChk_join _ _ _ _ _ 5340 5 1 h4 okB5345
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 7 = true := blkChk_join _ _ _ _ _ 5340 6 1 h5 okB5346
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 8 = true := blkChk_join _ _ _ _ _ 5340 7 1 h6 okB5347
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 9 = true := blkChk_join _ _ _ _ _ 5340 8 1 h7 okB5348
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 10 = true := blkChk_join _ _ _ _ _ 5340 9 1 h8 okB5349
  have h10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 11 = true := blkChk_join _ _ _ _ _ 5340 10 1 h9 okB5350
  have h11 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 5340 12 = true := blkChk_join _ _ _ _ _ 5340 11 1 h10 okB5351
  exact h11
end E1.C213X
