module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4587 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4588 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4588 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4589 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4589 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4590 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4590 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4591 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4591 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4592 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4592 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4593 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4593 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4594 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4594 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4595 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4595 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4596 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4596 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4597 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4597 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4598 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4598 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4599 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4599 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG485 : glueChkR lits W 4587 13 = true := by
  rw [← glueChkRN_eq lits W 7747 4587 lenT]; decide +kernel
theorem okM485 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 1 = true := okB4587
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 2 = true := blkChk_join _ _ _ _ _ 4587 1 1 h0 okB4588
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 3 = true := blkChk_join _ _ _ _ _ 4587 2 1 h1 okB4589
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 4 = true := blkChk_join _ _ _ _ _ 4587 3 1 h2 okB4590
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 5 = true := blkChk_join _ _ _ _ _ 4587 4 1 h3 okB4591
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 6 = true := blkChk_join _ _ _ _ _ 4587 5 1 h4 okB4592
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 7 = true := blkChk_join _ _ _ _ _ 4587 6 1 h5 okB4593
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 8 = true := blkChk_join _ _ _ _ _ 4587 7 1 h6 okB4594
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 9 = true := blkChk_join _ _ _ _ _ 4587 8 1 h7 okB4595
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 10 = true := blkChk_join _ _ _ _ _ 4587 9 1 h8 okB4596
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 11 = true := blkChk_join _ _ _ _ _ 4587 10 1 h9 okB4597
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 12 = true := blkChk_join _ _ _ _ _ 4587 11 1 h10 okB4598
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4587 13 = true := blkChk_join _ _ _ _ _ 4587 12 1 h11 okB4599
  exact h12
end E1.C284X
