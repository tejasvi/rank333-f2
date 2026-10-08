module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5469 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5470 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5470 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5471 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5471 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5472 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5472 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5473 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5473 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5474 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5474 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5475 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5475 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5476 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5476 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5477 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5477 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5478 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5478 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5479 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5479 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5480 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5480 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG580 : glueChkR lits W 5469 12 = true := by
  rw [← glueChkRN_eq lits W 7747 5469 lenT]; decide +kernel
theorem okM580 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 1 = true := okB5469
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 2 = true := blkChk_join _ _ _ _ _ 5469 1 1 h0 okB5470
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 3 = true := blkChk_join _ _ _ _ _ 5469 2 1 h1 okB5471
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 4 = true := blkChk_join _ _ _ _ _ 5469 3 1 h2 okB5472
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 5 = true := blkChk_join _ _ _ _ _ 5469 4 1 h3 okB5473
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 6 = true := blkChk_join _ _ _ _ _ 5469 5 1 h4 okB5474
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 7 = true := blkChk_join _ _ _ _ _ 5469 6 1 h5 okB5475
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 8 = true := blkChk_join _ _ _ _ _ 5469 7 1 h6 okB5476
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 9 = true := blkChk_join _ _ _ _ _ 5469 8 1 h7 okB5477
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 10 = true := blkChk_join _ _ _ _ _ 5469 9 1 h8 okB5478
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 11 = true := blkChk_join _ _ _ _ _ 5469 10 1 h9 okB5479
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5469 12 = true := blkChk_join _ _ _ _ _ 5469 11 1 h10 okB5480
  exact h11
end E1.C284X
