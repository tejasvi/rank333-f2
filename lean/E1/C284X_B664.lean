module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6370 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6371 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6371 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6372 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6372 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6373 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6373 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6374 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6374 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6375 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6375 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6376 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6376 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6377 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6377 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6378 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6378 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6379 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6379 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6380 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6380 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6381 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6381 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6382 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6382 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6383 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6383 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6384 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6384 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG664 : glueChkR lits W 6370 15 = true := by
  rw [← glueChkRN_eq lits W 7747 6370 lenT]; decide +kernel
theorem okM664 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 15 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 1 = true := okB6370
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 2 = true := blkChk_join _ _ _ _ _ 6370 1 1 h0 okB6371
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 3 = true := blkChk_join _ _ _ _ _ 6370 2 1 h1 okB6372
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 4 = true := blkChk_join _ _ _ _ _ 6370 3 1 h2 okB6373
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 5 = true := blkChk_join _ _ _ _ _ 6370 4 1 h3 okB6374
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 6 = true := blkChk_join _ _ _ _ _ 6370 5 1 h4 okB6375
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 7 = true := blkChk_join _ _ _ _ _ 6370 6 1 h5 okB6376
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 8 = true := blkChk_join _ _ _ _ _ 6370 7 1 h6 okB6377
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 9 = true := blkChk_join _ _ _ _ _ 6370 8 1 h7 okB6378
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 10 = true := blkChk_join _ _ _ _ _ 6370 9 1 h8 okB6379
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 11 = true := blkChk_join _ _ _ _ _ 6370 10 1 h9 okB6380
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 12 = true := blkChk_join _ _ _ _ _ 6370 11 1 h10 okB6381
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 13 = true := blkChk_join _ _ _ _ _ 6370 12 1 h11 okB6382
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 14 = true := blkChk_join _ _ _ _ _ 6370 13 1 h12 okB6383
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6370 15 = true := blkChk_join _ _ _ _ _ 6370 14 1 h13 okB6384
  exact h14
end E1.C284X
