module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3328 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3329 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3329 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3330 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3330 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3331 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3331 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3332 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3332 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3333 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3333 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3334 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3334 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3335 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3335 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3336 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3336 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3337 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3337 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG355 : glueChkR lits W 3328 10 = true := by
  rw [← glueChkRN_eq lits W 7747 3328 lenT]; decide +kernel
theorem okM355 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 1 = true := okB3328
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 2 = true := blkChk_join _ _ _ _ _ 3328 1 1 h0 okB3329
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 3 = true := blkChk_join _ _ _ _ _ 3328 2 1 h1 okB3330
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 4 = true := blkChk_join _ _ _ _ _ 3328 3 1 h2 okB3331
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 5 = true := blkChk_join _ _ _ _ _ 3328 4 1 h3 okB3332
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 6 = true := blkChk_join _ _ _ _ _ 3328 5 1 h4 okB3333
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 7 = true := blkChk_join _ _ _ _ _ 3328 6 1 h5 okB3334
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 8 = true := blkChk_join _ _ _ _ _ 3328 7 1 h6 okB3335
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 9 = true := blkChk_join _ _ _ _ _ 3328 8 1 h7 okB3336
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3328 10 = true := blkChk_join _ _ _ _ _ 3328 9 1 h8 okB3337
  exact h9
end E1.C284X
