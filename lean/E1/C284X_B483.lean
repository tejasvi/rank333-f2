module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4564 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4565 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4565 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4566 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4566 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4567 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4567 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4568 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4568 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4569 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4569 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4570 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4570 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4571 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4571 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4572 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4572 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4573 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4573 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4574 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4574 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4575 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4575 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG483 : glueChkR lits W 4564 12 = true := by
  rw [← glueChkRN_eq lits W 7747 4564 lenT]; decide +kernel
theorem okM483 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 1 = true := okB4564
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 2 = true := blkChk_join _ _ _ _ _ 4564 1 1 h0 okB4565
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 3 = true := blkChk_join _ _ _ _ _ 4564 2 1 h1 okB4566
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 4 = true := blkChk_join _ _ _ _ _ 4564 3 1 h2 okB4567
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 5 = true := blkChk_join _ _ _ _ _ 4564 4 1 h3 okB4568
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 6 = true := blkChk_join _ _ _ _ _ 4564 5 1 h4 okB4569
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 7 = true := blkChk_join _ _ _ _ _ 4564 6 1 h5 okB4570
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 8 = true := blkChk_join _ _ _ _ _ 4564 7 1 h6 okB4571
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 9 = true := blkChk_join _ _ _ _ _ 4564 8 1 h7 okB4572
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 10 = true := blkChk_join _ _ _ _ _ 4564 9 1 h8 okB4573
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 11 = true := blkChk_join _ _ _ _ _ 4564 10 1 h9 okB4574
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4564 12 = true := blkChk_join _ _ _ _ _ 4564 11 1 h10 okB4575
  exact h11
end E1.C284X
