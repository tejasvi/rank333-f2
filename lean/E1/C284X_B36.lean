module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB346 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 346 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB347 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 347 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB348 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 348 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB349 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 349 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB350 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 350 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB351 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 351 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB352 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 352 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB353 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 353 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG36 : glueChkR lits W 346 8 = true := by
  rw [← glueChkRN_eq lits W 7747 346 lenT]; decide +kernel
theorem okM36 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 346 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 346 1 = true := okB346
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 346 2 = true := blkChk_join _ _ _ _ _ 346 1 1 h0 okB347
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 346 3 = true := blkChk_join _ _ _ _ _ 346 2 1 h1 okB348
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 346 4 = true := blkChk_join _ _ _ _ _ 346 3 1 h2 okB349
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 346 5 = true := blkChk_join _ _ _ _ _ 346 4 1 h3 okB350
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 346 6 = true := blkChk_join _ _ _ _ _ 346 5 1 h4 okB351
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 346 7 = true := blkChk_join _ _ _ _ _ 346 6 1 h5 okB352
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 346 8 = true := blkChk_join _ _ _ _ _ 346 7 1 h6 okB353
  exact h7
end E1.C284X
