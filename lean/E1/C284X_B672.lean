module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6448 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6449 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6449 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6450 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6450 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6451 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6451 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6452 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6452 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6453 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6453 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6454 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6454 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6455 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6455 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6456 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6456 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6457 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6457 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6458 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6458 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG672 : glueChkR lits W 6448 11 = true := by
  rw [← glueChkRN_eq lits W 7747 6448 lenT]; decide +kernel
theorem okM672 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 1 = true := okB6448
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 2 = true := blkChk_join _ _ _ _ _ 6448 1 1 h0 okB6449
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 3 = true := blkChk_join _ _ _ _ _ 6448 2 1 h1 okB6450
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 4 = true := blkChk_join _ _ _ _ _ 6448 3 1 h2 okB6451
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 5 = true := blkChk_join _ _ _ _ _ 6448 4 1 h3 okB6452
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 6 = true := blkChk_join _ _ _ _ _ 6448 5 1 h4 okB6453
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 7 = true := blkChk_join _ _ _ _ _ 6448 6 1 h5 okB6454
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 8 = true := blkChk_join _ _ _ _ _ 6448 7 1 h6 okB6455
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 9 = true := blkChk_join _ _ _ _ _ 6448 8 1 h7 okB6456
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 10 = true := blkChk_join _ _ _ _ _ 6448 9 1 h8 okB6457
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6448 11 = true := blkChk_join _ _ _ _ _ 6448 10 1 h9 okB6458
  exact h10
end E1.C284X
