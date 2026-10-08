module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2582 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2582 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2583 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2583 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2584 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2584 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2585 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2585 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2586 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2586 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2587 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2587 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2588 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2588 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2589 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2589 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG279 : glueChkR lits W 2582 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2582 lenT]; decide +kernel
theorem okM279 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2582 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2582 1 = true := okB2582
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2582 2 = true := blkChk_join _ _ _ _ _ 2582 1 1 h0 okB2583
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2582 3 = true := blkChk_join _ _ _ _ _ 2582 2 1 h1 okB2584
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2582 4 = true := blkChk_join _ _ _ _ _ 2582 3 1 h2 okB2585
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2582 5 = true := blkChk_join _ _ _ _ _ 2582 4 1 h3 okB2586
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2582 6 = true := blkChk_join _ _ _ _ _ 2582 5 1 h4 okB2587
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2582 7 = true := blkChk_join _ _ _ _ _ 2582 6 1 h5 okB2588
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2582 8 = true := blkChk_join _ _ _ _ _ 2582 7 1 h6 okB2589
  exact h7
end E1.C284X
