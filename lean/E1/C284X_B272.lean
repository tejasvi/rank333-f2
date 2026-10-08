module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2497 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2497 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2498 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2498 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2499 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2499 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2500 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2500 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2501 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2501 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2502 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2502 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2503 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2503 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2504 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2504 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG272 : glueChkR lits W 2497 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2497 lenT]; decide +kernel
theorem okM272 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2497 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2497 1 = true := okB2497
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2497 2 = true := blkChk_join _ _ _ _ _ 2497 1 1 h0 okB2498
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2497 3 = true := blkChk_join _ _ _ _ _ 2497 2 1 h1 okB2499
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2497 4 = true := blkChk_join _ _ _ _ _ 2497 3 1 h2 okB2500
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2497 5 = true := blkChk_join _ _ _ _ _ 2497 4 1 h3 okB2501
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2497 6 = true := blkChk_join _ _ _ _ _ 2497 5 1 h4 okB2502
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2497 7 = true := blkChk_join _ _ _ _ _ 2497 6 1 h5 okB2503
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2497 8 = true := blkChk_join _ _ _ _ _ 2497 7 1 h6 okB2504
  exact h7
end E1.C284X
