module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3535 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3536 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3536 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3537 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3537 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3538 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3538 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3539 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3539 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3540 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3540 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3541 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3541 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3542 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3542 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3543 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3543 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3544 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3544 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3545 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3545 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3546 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3546 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3547 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3547 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG375 : glueChkR lits W 3535 13 = true := by
  rw [← glueChkRN_eq lits W 7747 3535 lenT]; decide +kernel
theorem okM375 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 1 = true := okB3535
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 2 = true := blkChk_join _ _ _ _ _ 3535 1 1 h0 okB3536
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 3 = true := blkChk_join _ _ _ _ _ 3535 2 1 h1 okB3537
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 4 = true := blkChk_join _ _ _ _ _ 3535 3 1 h2 okB3538
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 5 = true := blkChk_join _ _ _ _ _ 3535 4 1 h3 okB3539
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 6 = true := blkChk_join _ _ _ _ _ 3535 5 1 h4 okB3540
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 7 = true := blkChk_join _ _ _ _ _ 3535 6 1 h5 okB3541
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 8 = true := blkChk_join _ _ _ _ _ 3535 7 1 h6 okB3542
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 9 = true := blkChk_join _ _ _ _ _ 3535 8 1 h7 okB3543
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 10 = true := blkChk_join _ _ _ _ _ 3535 9 1 h8 okB3544
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 11 = true := blkChk_join _ _ _ _ _ 3535 10 1 h9 okB3545
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 12 = true := blkChk_join _ _ _ _ _ 3535 11 1 h10 okB3546
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3535 13 = true := blkChk_join _ _ _ _ _ 3535 12 1 h11 okB3547
  exact h12
end E1.C284X
