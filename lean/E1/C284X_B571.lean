module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5383 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5383 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5384 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5384 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5385 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5385 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5386 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5386 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5387 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5387 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5388 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5388 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG571 : glueChkR lits W 5383 6 = true := by
  rw [← glueChkRN_eq lits W 7747 5383 lenT]; decide +kernel
theorem okM571 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5383 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5383 1 = true := okB5383
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5383 2 = true := blkChk_join _ _ _ _ _ 5383 1 1 h0 okB5384
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5383 3 = true := blkChk_join _ _ _ _ _ 5383 2 1 h1 okB5385
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5383 4 = true := blkChk_join _ _ _ _ _ 5383 3 1 h2 okB5386
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5383 5 = true := blkChk_join _ _ _ _ _ 5383 4 1 h3 okB5387
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5383 6 = true := blkChk_join _ _ _ _ _ 5383 5 1 h4 okB5388
  exact h5
end E1.C284X
