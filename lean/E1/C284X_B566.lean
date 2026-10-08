module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5330 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5331 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5331 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5332 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5332 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5333 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5333 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5334 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5334 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5335 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5335 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5336 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5336 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5337 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5337 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5338 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5338 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5339 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5339 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG566 : glueChkR lits W 5330 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5330 lenT]; decide +kernel
theorem okM566 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 1 = true := okB5330
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 2 = true := blkChk_join _ _ _ _ _ 5330 1 1 h0 okB5331
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 3 = true := blkChk_join _ _ _ _ _ 5330 2 1 h1 okB5332
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 4 = true := blkChk_join _ _ _ _ _ 5330 3 1 h2 okB5333
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 5 = true := blkChk_join _ _ _ _ _ 5330 4 1 h3 okB5334
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 6 = true := blkChk_join _ _ _ _ _ 5330 5 1 h4 okB5335
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 7 = true := blkChk_join _ _ _ _ _ 5330 6 1 h5 okB5336
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 8 = true := blkChk_join _ _ _ _ _ 5330 7 1 h6 okB5337
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 9 = true := blkChk_join _ _ _ _ _ 5330 8 1 h7 okB5338
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5330 10 = true := blkChk_join _ _ _ _ _ 5330 9 1 h8 okB5339
  exact h9
end E1.C284X
