module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5478 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5479 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5479 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5480 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5480 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5481 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5481 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5482 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5482 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5483 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5483 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5484 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5484 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5485 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5485 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5486 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5486 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5487 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5487 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5488 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5488 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG534 : glueChkR lits W 5478 11 = true := by
  rw [← glueChkRN_eq lits W 8596 5478 lenT]; decide +kernel
theorem okM534 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 11 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 1 = true := okB5478
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 2 = true := blkChk_join _ _ _ _ _ 5478 1 1 h0 okB5479
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 3 = true := blkChk_join _ _ _ _ _ 5478 2 1 h1 okB5480
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 4 = true := blkChk_join _ _ _ _ _ 5478 3 1 h2 okB5481
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 5 = true := blkChk_join _ _ _ _ _ 5478 4 1 h3 okB5482
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 6 = true := blkChk_join _ _ _ _ _ 5478 5 1 h4 okB5483
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 7 = true := blkChk_join _ _ _ _ _ 5478 6 1 h5 okB5484
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 8 = true := blkChk_join _ _ _ _ _ 5478 7 1 h6 okB5485
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 9 = true := blkChk_join _ _ _ _ _ 5478 8 1 h7 okB5486
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 10 = true := blkChk_join _ _ _ _ _ 5478 9 1 h8 okB5487
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5478 11 = true := blkChk_join _ _ _ _ _ 5478 10 1 h9 okB5488
  exact h10
end E1.C236X
