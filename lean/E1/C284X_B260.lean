module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2371 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2372 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2372 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2373 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2373 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2374 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2374 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2375 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2375 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2376 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2376 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2377 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2377 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2378 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2378 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2379 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2379 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG260 : glueChkR lits W 2371 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2371 lenT]; decide +kernel
theorem okM260 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 1 = true := okB2371
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 2 = true := blkChk_join _ _ _ _ _ 2371 1 1 h0 okB2372
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 3 = true := blkChk_join _ _ _ _ _ 2371 2 1 h1 okB2373
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 4 = true := blkChk_join _ _ _ _ _ 2371 3 1 h2 okB2374
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 5 = true := blkChk_join _ _ _ _ _ 2371 4 1 h3 okB2375
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 6 = true := blkChk_join _ _ _ _ _ 2371 5 1 h4 okB2376
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 7 = true := blkChk_join _ _ _ _ _ 2371 6 1 h5 okB2377
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 8 = true := blkChk_join _ _ _ _ _ 2371 7 1 h6 okB2378
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2371 9 = true := blkChk_join _ _ _ _ _ 2371 8 1 h7 okB2379
  exact h8
end E1.C284X
