module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4484 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4484 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4485 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4485 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4486 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4486 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4487 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4487 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4488 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4488 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4489 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4489 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4490 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4490 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4491 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4491 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG476 : glueChkR lits W 4484 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4484 lenT]; decide +kernel
theorem okM476 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4484 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4484 1 = true := okB4484
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4484 2 = true := blkChk_join _ _ _ _ _ 4484 1 1 h0 okB4485
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4484 3 = true := blkChk_join _ _ _ _ _ 4484 2 1 h1 okB4486
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4484 4 = true := blkChk_join _ _ _ _ _ 4484 3 1 h2 okB4487
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4484 5 = true := blkChk_join _ _ _ _ _ 4484 4 1 h3 okB4488
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4484 6 = true := blkChk_join _ _ _ _ _ 4484 5 1 h4 okB4489
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4484 7 = true := blkChk_join _ _ _ _ _ 4484 6 1 h5 okB4490
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4484 8 = true := blkChk_join _ _ _ _ _ 4484 7 1 h6 okB4491
  exact h7
end E1.C284X
