module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4487 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4487 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4488 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4488 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4489 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4489 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4490 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4490 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4491 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4491 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4492 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4492 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4493 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4493 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG440 : glueChkR lits W 4487 7 = true := by
  rw [← glueChkRN_eq lits W 8596 4487 lenT]; decide +kernel
theorem okM440 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4487 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4487 1 = true := okB4487
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4487 2 = true := blkChk_join _ _ _ _ _ 4487 1 1 h0 okB4488
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4487 3 = true := blkChk_join _ _ _ _ _ 4487 2 1 h1 okB4489
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4487 4 = true := blkChk_join _ _ _ _ _ 4487 3 1 h2 okB4490
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4487 5 = true := blkChk_join _ _ _ _ _ 4487 4 1 h3 okB4491
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4487 6 = true := blkChk_join _ _ _ _ _ 4487 5 1 h4 okB4492
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4487 7 = true := blkChk_join _ _ _ _ _ 4487 6 1 h5 okB4493
  exact h6
end E1.C236X
