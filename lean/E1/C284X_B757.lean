module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7507 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7508 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7508 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7509 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7509 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7510 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7510 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7511 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7511 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7512 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7512 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7513 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7513 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7514 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7514 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7515 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7515 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7516 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7516 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7517 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7517 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7518 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7518 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG757 : glueChkR lits W 7507 12 = true := by
  rw [← glueChkRN_eq lits W 7747 7507 lenT]; decide +kernel
theorem okM757 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 1 = true := okB7507
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 2 = true := blkChk_join _ _ _ _ _ 7507 1 1 h0 okB7508
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 3 = true := blkChk_join _ _ _ _ _ 7507 2 1 h1 okB7509
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 4 = true := blkChk_join _ _ _ _ _ 7507 3 1 h2 okB7510
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 5 = true := blkChk_join _ _ _ _ _ 7507 4 1 h3 okB7511
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 6 = true := blkChk_join _ _ _ _ _ 7507 5 1 h4 okB7512
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 7 = true := blkChk_join _ _ _ _ _ 7507 6 1 h5 okB7513
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 8 = true := blkChk_join _ _ _ _ _ 7507 7 1 h6 okB7514
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 9 = true := blkChk_join _ _ _ _ _ 7507 8 1 h7 okB7515
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 10 = true := blkChk_join _ _ _ _ _ 7507 9 1 h8 okB7516
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 11 = true := blkChk_join _ _ _ _ _ 7507 10 1 h9 okB7517
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7507 12 = true := blkChk_join _ _ _ _ _ 7507 11 1 h10 okB7518
  exact h11
end E1.C284X
