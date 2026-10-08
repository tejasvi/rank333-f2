module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3373 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 1 = true := by decide +kernel
theorem okB3374 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3374 1 = true := by decide +kernel
theorem okB3375 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3375 1 = true := by decide +kernel
theorem okB3376 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3376 1 = true := by decide +kernel
theorem okB3377 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3377 1 = true := by decide +kernel
theorem okB3378 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3378 1 = true := by decide +kernel
theorem okB3379 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3379 1 = true := by decide +kernel
theorem okB3380 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3380 1 = true := by decide +kernel
theorem okB3381 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3381 1 = true := by decide +kernel
theorem okB3382 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3382 1 = true := by decide +kernel
theorem okB3383 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3383 1 = true := by decide +kernel
theorem okB3384 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3384 1 = true := by decide +kernel
theorem okG324 : glueChkR lits W 3373 12 = true := by decide +kernel
theorem okM324 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 1 = true := okB3373
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 2 = true := blkChk_join _ _ _ _ _ 3373 1 1 h0 okB3374
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 3 = true := blkChk_join _ _ _ _ _ 3373 2 1 h1 okB3375
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 4 = true := blkChk_join _ _ _ _ _ 3373 3 1 h2 okB3376
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 5 = true := blkChk_join _ _ _ _ _ 3373 4 1 h3 okB3377
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 6 = true := blkChk_join _ _ _ _ _ 3373 5 1 h4 okB3378
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 7 = true := blkChk_join _ _ _ _ _ 3373 6 1 h5 okB3379
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 8 = true := blkChk_join _ _ _ _ _ 3373 7 1 h6 okB3380
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 9 = true := blkChk_join _ _ _ _ _ 3373 8 1 h7 okB3381
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 10 = true := blkChk_join _ _ _ _ _ 3373 9 1 h8 okB3382
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 11 = true := blkChk_join _ _ _ _ _ 3373 10 1 h9 okB3383
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3373 12 = true := blkChk_join _ _ _ _ _ 3373 11 1 h10 okB3384
  exact h11
end E1.C384X
