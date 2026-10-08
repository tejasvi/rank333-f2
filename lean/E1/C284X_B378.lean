module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3569 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3570 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3570 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3571 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3571 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3572 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3572 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3573 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3573 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3574 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3574 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3575 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3575 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3576 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3576 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3577 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3577 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3578 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3578 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3579 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3579 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG378 : glueChkR lits W 3569 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3569 lenT]; decide +kernel
theorem okM378 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 1 = true := okB3569
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 2 = true := blkChk_join _ _ _ _ _ 3569 1 1 h0 okB3570
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 3 = true := blkChk_join _ _ _ _ _ 3569 2 1 h1 okB3571
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 4 = true := blkChk_join _ _ _ _ _ 3569 3 1 h2 okB3572
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 5 = true := blkChk_join _ _ _ _ _ 3569 4 1 h3 okB3573
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 6 = true := blkChk_join _ _ _ _ _ 3569 5 1 h4 okB3574
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 7 = true := blkChk_join _ _ _ _ _ 3569 6 1 h5 okB3575
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 8 = true := blkChk_join _ _ _ _ _ 3569 7 1 h6 okB3576
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 9 = true := blkChk_join _ _ _ _ _ 3569 8 1 h7 okB3577
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 10 = true := blkChk_join _ _ _ _ _ 3569 9 1 h8 okB3578
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3569 11 = true := blkChk_join _ _ _ _ _ 3569 10 1 h9 okB3579
  exact h10
end E1.C284X
