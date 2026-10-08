module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6528 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6529 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6529 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6530 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6530 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6531 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6531 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6532 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6532 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6533 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6533 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6534 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6534 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6535 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6535 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6536 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6536 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6537 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6537 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6538 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6538 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6539 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6539 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6540 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6540 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG680 : glueChkR lits W 6528 13 = true := by
  rw [← glueChkRN_eq lits W 7747 6528 lenT]; decide +kernel
theorem okM680 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 1 = true := okB6528
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 2 = true := blkChk_join _ _ _ _ _ 6528 1 1 h0 okB6529
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 3 = true := blkChk_join _ _ _ _ _ 6528 2 1 h1 okB6530
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 4 = true := blkChk_join _ _ _ _ _ 6528 3 1 h2 okB6531
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 5 = true := blkChk_join _ _ _ _ _ 6528 4 1 h3 okB6532
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 6 = true := blkChk_join _ _ _ _ _ 6528 5 1 h4 okB6533
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 7 = true := blkChk_join _ _ _ _ _ 6528 6 1 h5 okB6534
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 8 = true := blkChk_join _ _ _ _ _ 6528 7 1 h6 okB6535
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 9 = true := blkChk_join _ _ _ _ _ 6528 8 1 h7 okB6536
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 10 = true := blkChk_join _ _ _ _ _ 6528 9 1 h8 okB6537
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 11 = true := blkChk_join _ _ _ _ _ 6528 10 1 h9 okB6538
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 12 = true := blkChk_join _ _ _ _ _ 6528 11 1 h10 okB6539
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6528 13 = true := blkChk_join _ _ _ _ _ 6528 12 1 h11 okB6540
  exact h12
end E1.C284X
