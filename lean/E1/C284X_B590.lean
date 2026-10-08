module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5578 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5579 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5579 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5580 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5580 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5581 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5581 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5582 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5582 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5583 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5583 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5584 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5584 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5585 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5585 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5586 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5586 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5587 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5587 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG590 : glueChkR lits W 5578 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5578 lenT]; decide +kernel
theorem okM590 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 1 = true := okB5578
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 2 = true := blkChk_join _ _ _ _ _ 5578 1 1 h0 okB5579
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 3 = true := blkChk_join _ _ _ _ _ 5578 2 1 h1 okB5580
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 4 = true := blkChk_join _ _ _ _ _ 5578 3 1 h2 okB5581
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 5 = true := blkChk_join _ _ _ _ _ 5578 4 1 h3 okB5582
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 6 = true := blkChk_join _ _ _ _ _ 5578 5 1 h4 okB5583
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 7 = true := blkChk_join _ _ _ _ _ 5578 6 1 h5 okB5584
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 8 = true := blkChk_join _ _ _ _ _ 5578 7 1 h6 okB5585
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 9 = true := blkChk_join _ _ _ _ _ 5578 8 1 h7 okB5586
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5578 10 = true := blkChk_join _ _ _ _ _ 5578 9 1 h8 okB5587
  exact h9
end E1.C284X
