module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4576 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4577 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4577 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4578 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4578 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4579 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4579 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4580 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4580 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4581 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4581 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4582 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4582 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4583 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4583 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4584 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4584 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4585 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4585 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4586 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4586 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG484 : glueChkR lits W 4576 11 = true := by
  rw [← glueChkRN_eq lits W 7747 4576 lenT]; decide +kernel
theorem okM484 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 1 = true := okB4576
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 2 = true := blkChk_join _ _ _ _ _ 4576 1 1 h0 okB4577
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 3 = true := blkChk_join _ _ _ _ _ 4576 2 1 h1 okB4578
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 4 = true := blkChk_join _ _ _ _ _ 4576 3 1 h2 okB4579
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 5 = true := blkChk_join _ _ _ _ _ 4576 4 1 h3 okB4580
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 6 = true := blkChk_join _ _ _ _ _ 4576 5 1 h4 okB4581
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 7 = true := blkChk_join _ _ _ _ _ 4576 6 1 h5 okB4582
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 8 = true := blkChk_join _ _ _ _ _ 4576 7 1 h6 okB4583
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 9 = true := blkChk_join _ _ _ _ _ 4576 8 1 h7 okB4584
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 10 = true := blkChk_join _ _ _ _ _ 4576 9 1 h8 okB4585
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4576 11 = true := blkChk_join _ _ _ _ _ 4576 10 1 h9 okB4586
  exact h10
end E1.C284X
