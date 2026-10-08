module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3597 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3598 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3598 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3599 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3599 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3600 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3600 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3601 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3601 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3602 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3602 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3603 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3603 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3604 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3604 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3605 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3605 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3606 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3606 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3607 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3607 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3608 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3608 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG381 : glueChkR lits W 3597 12 = true := by
  rw [← glueChkRN_eq lits W 7747 3597 lenT]; decide +kernel
theorem okM381 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 1 = true := okB3597
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 2 = true := blkChk_join _ _ _ _ _ 3597 1 1 h0 okB3598
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 3 = true := blkChk_join _ _ _ _ _ 3597 2 1 h1 okB3599
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 4 = true := blkChk_join _ _ _ _ _ 3597 3 1 h2 okB3600
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 5 = true := blkChk_join _ _ _ _ _ 3597 4 1 h3 okB3601
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 6 = true := blkChk_join _ _ _ _ _ 3597 5 1 h4 okB3602
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 7 = true := blkChk_join _ _ _ _ _ 3597 6 1 h5 okB3603
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 8 = true := blkChk_join _ _ _ _ _ 3597 7 1 h6 okB3604
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 9 = true := blkChk_join _ _ _ _ _ 3597 8 1 h7 okB3605
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 10 = true := blkChk_join _ _ _ _ _ 3597 9 1 h8 okB3606
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 11 = true := blkChk_join _ _ _ _ _ 3597 10 1 h9 okB3607
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3597 12 = true := blkChk_join _ _ _ _ _ 3597 11 1 h10 okB3608
  exact h11
end E1.C284X
