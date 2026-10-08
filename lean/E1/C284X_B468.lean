module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4395 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4395 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4396 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4396 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4397 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4397 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4398 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4398 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4399 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4399 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4400 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4400 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4401 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4401 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4402 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4402 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG468 : glueChkR lits W 4395 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4395 lenT]; decide +kernel
theorem okM468 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4395 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4395 1 = true := okB4395
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4395 2 = true := blkChk_join _ _ _ _ _ 4395 1 1 h0 okB4396
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4395 3 = true := blkChk_join _ _ _ _ _ 4395 2 1 h1 okB4397
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4395 4 = true := blkChk_join _ _ _ _ _ 4395 3 1 h2 okB4398
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4395 5 = true := blkChk_join _ _ _ _ _ 4395 4 1 h3 okB4399
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4395 6 = true := blkChk_join _ _ _ _ _ 4395 5 1 h4 okB4400
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4395 7 = true := blkChk_join _ _ _ _ _ 4395 6 1 h5 okB4401
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4395 8 = true := blkChk_join _ _ _ _ _ 4395 7 1 h6 okB4402
  exact h7
end E1.C284X
