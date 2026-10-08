module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB380 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 380 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB381 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 381 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB382 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 382 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB383 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 383 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB384 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 384 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB385 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 385 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG40 : glueChkR lits W 380 6 = true := by
  rw [← glueChkRN_eq lits W 7747 380 lenT]; decide +kernel
theorem okM40 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 380 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 380 1 = true := okB380
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 380 2 = true := blkChk_join _ _ _ _ _ 380 1 1 h0 okB381
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 380 3 = true := blkChk_join _ _ _ _ _ 380 2 1 h1 okB382
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 380 4 = true := blkChk_join _ _ _ _ _ 380 3 1 h2 okB383
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 380 5 = true := blkChk_join _ _ _ _ _ 380 4 1 h3 okB384
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 380 6 = true := blkChk_join _ _ _ _ _ 380 5 1 h4 okB385
  exact h5
end E1.C284X
