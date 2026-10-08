module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2364 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2364 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2365 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2365 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2366 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2366 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2367 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2367 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2368 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2368 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2369 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2369 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2370 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2370 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG259 : glueChkR lits W 2364 7 = true := by
  rw [← glueChkRN_eq lits W 7747 2364 lenT]; decide +kernel
theorem okM259 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2364 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2364 1 = true := okB2364
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2364 2 = true := blkChk_join _ _ _ _ _ 2364 1 1 h0 okB2365
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2364 3 = true := blkChk_join _ _ _ _ _ 2364 2 1 h1 okB2366
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2364 4 = true := blkChk_join _ _ _ _ _ 2364 3 1 h2 okB2367
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2364 5 = true := blkChk_join _ _ _ _ _ 2364 4 1 h3 okB2368
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2364 6 = true := blkChk_join _ _ _ _ _ 2364 5 1 h4 okB2369
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2364 7 = true := blkChk_join _ _ _ _ _ 2364 6 1 h5 okB2370
  exact h6
end E1.C284X
