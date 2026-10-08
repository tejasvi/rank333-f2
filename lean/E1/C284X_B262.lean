module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2391 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2391 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2392 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2392 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2393 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2393 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2394 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2394 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2395 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2395 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2396 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2396 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2397 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2397 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2398 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2398 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG262 : glueChkR lits W 2391 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2391 lenT]; decide +kernel
theorem okM262 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2391 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2391 1 = true := okB2391
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2391 2 = true := blkChk_join _ _ _ _ _ 2391 1 1 h0 okB2392
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2391 3 = true := blkChk_join _ _ _ _ _ 2391 2 1 h1 okB2393
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2391 4 = true := blkChk_join _ _ _ _ _ 2391 3 1 h2 okB2394
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2391 5 = true := blkChk_join _ _ _ _ _ 2391 4 1 h3 okB2395
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2391 6 = true := blkChk_join _ _ _ _ _ 2391 5 1 h4 okB2396
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2391 7 = true := blkChk_join _ _ _ _ _ 2391 6 1 h5 okB2397
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2391 8 = true := blkChk_join _ _ _ _ _ 2391 7 1 h6 okB2398
  exact h7
end E1.C284X
