module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5533 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5534 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5534 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5535 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5535 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5536 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5536 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5537 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5537 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5538 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5538 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5539 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5539 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5540 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5540 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5541 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5541 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5542 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5542 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5543 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5543 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG586 : glueChkR lits W 5533 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5533 lenT]; decide +kernel
theorem okM586 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 1 = true := okB5533
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 2 = true := blkChk_join _ _ _ _ _ 5533 1 1 h0 okB5534
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 3 = true := blkChk_join _ _ _ _ _ 5533 2 1 h1 okB5535
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 4 = true := blkChk_join _ _ _ _ _ 5533 3 1 h2 okB5536
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 5 = true := blkChk_join _ _ _ _ _ 5533 4 1 h3 okB5537
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 6 = true := blkChk_join _ _ _ _ _ 5533 5 1 h4 okB5538
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 7 = true := blkChk_join _ _ _ _ _ 5533 6 1 h5 okB5539
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 8 = true := blkChk_join _ _ _ _ _ 5533 7 1 h6 okB5540
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 9 = true := blkChk_join _ _ _ _ _ 5533 8 1 h7 okB5541
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 10 = true := blkChk_join _ _ _ _ _ 5533 9 1 h8 okB5542
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5533 11 = true := blkChk_join _ _ _ _ _ 5533 10 1 h9 okB5543
  exact h10
end E1.C284X
