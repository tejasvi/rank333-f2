module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3501 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3502 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3502 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3503 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3503 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3504 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3504 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3505 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3505 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3506 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3506 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3507 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3507 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3508 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3508 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3509 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3509 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3510 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3510 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3511 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3511 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3512 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3512 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3513 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3513 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3514 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3514 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3515 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3515 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3516 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3516 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG342 : glueChkR lits W 3501 16 = true := by
  rw [← glueChkRN_eq lits W 8596 3501 lenT]; decide +kernel
theorem okM342 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 16 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 1 = true := okB3501
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 2 = true := blkChk_join _ _ _ _ _ 3501 1 1 h0 okB3502
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 3 = true := blkChk_join _ _ _ _ _ 3501 2 1 h1 okB3503
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 4 = true := blkChk_join _ _ _ _ _ 3501 3 1 h2 okB3504
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 5 = true := blkChk_join _ _ _ _ _ 3501 4 1 h3 okB3505
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 6 = true := blkChk_join _ _ _ _ _ 3501 5 1 h4 okB3506
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 7 = true := blkChk_join _ _ _ _ _ 3501 6 1 h5 okB3507
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 8 = true := blkChk_join _ _ _ _ _ 3501 7 1 h6 okB3508
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 9 = true := blkChk_join _ _ _ _ _ 3501 8 1 h7 okB3509
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 10 = true := blkChk_join _ _ _ _ _ 3501 9 1 h8 okB3510
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 11 = true := blkChk_join _ _ _ _ _ 3501 10 1 h9 okB3511
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 12 = true := blkChk_join _ _ _ _ _ 3501 11 1 h10 okB3512
  have h12 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 13 = true := blkChk_join _ _ _ _ _ 3501 12 1 h11 okB3513
  have h13 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 14 = true := blkChk_join _ _ _ _ _ 3501 13 1 h12 okB3514
  have h14 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 15 = true := blkChk_join _ _ _ _ _ 3501 14 1 h13 okB3515
  have h15 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3501 16 = true := blkChk_join _ _ _ _ _ 3501 15 1 h14 okB3516
  exact h15
end E1.C236X
