module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5494 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5495 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5495 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5496 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5496 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5497 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5497 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5498 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5498 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5499 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5499 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5500 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5500 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5501 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5501 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5502 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5502 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5503 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5503 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG582 : glueChkR lits W 5494 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5494 lenT]; decide +kernel
theorem okM582 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 1 = true := okB5494
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 2 = true := blkChk_join _ _ _ _ _ 5494 1 1 h0 okB5495
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 3 = true := blkChk_join _ _ _ _ _ 5494 2 1 h1 okB5496
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 4 = true := blkChk_join _ _ _ _ _ 5494 3 1 h2 okB5497
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 5 = true := blkChk_join _ _ _ _ _ 5494 4 1 h3 okB5498
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 6 = true := blkChk_join _ _ _ _ _ 5494 5 1 h4 okB5499
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 7 = true := blkChk_join _ _ _ _ _ 5494 6 1 h5 okB5500
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 8 = true := blkChk_join _ _ _ _ _ 5494 7 1 h6 okB5501
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 9 = true := blkChk_join _ _ _ _ _ 5494 8 1 h7 okB5502
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5494 10 = true := blkChk_join _ _ _ _ _ 5494 9 1 h8 okB5503
  exact h9
end E1.C284X
