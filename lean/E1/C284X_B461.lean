module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4328 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4329 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4329 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4330 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4330 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4331 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4331 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4332 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4332 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4333 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4333 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4334 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4334 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4335 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4335 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4336 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4336 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4337 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4337 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4338 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4338 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4339 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4339 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4340 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4340 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG461 : glueChkR lits W 4328 13 = true := by
  rw [← glueChkRN_eq lits W 7747 4328 lenT]; decide +kernel
theorem okM461 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 1 = true := okB4328
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 2 = true := blkChk_join _ _ _ _ _ 4328 1 1 h0 okB4329
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 3 = true := blkChk_join _ _ _ _ _ 4328 2 1 h1 okB4330
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 4 = true := blkChk_join _ _ _ _ _ 4328 3 1 h2 okB4331
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 5 = true := blkChk_join _ _ _ _ _ 4328 4 1 h3 okB4332
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 6 = true := blkChk_join _ _ _ _ _ 4328 5 1 h4 okB4333
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 7 = true := blkChk_join _ _ _ _ _ 4328 6 1 h5 okB4334
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 8 = true := blkChk_join _ _ _ _ _ 4328 7 1 h6 okB4335
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 9 = true := blkChk_join _ _ _ _ _ 4328 8 1 h7 okB4336
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 10 = true := blkChk_join _ _ _ _ _ 4328 9 1 h8 okB4337
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 11 = true := blkChk_join _ _ _ _ _ 4328 10 1 h9 okB4338
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 12 = true := blkChk_join _ _ _ _ _ 4328 11 1 h10 okB4339
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4328 13 = true := blkChk_join _ _ _ _ _ 4328 12 1 h11 okB4340
  exact h12
end E1.C284X
