module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB568 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB569 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 569 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB570 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 570 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB571 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 571 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB572 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 572 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB573 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 573 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB574 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 574 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB575 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 575 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB576 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 576 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB577 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 577 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG65 : glueChkR lits W 568 10 = true := by
  rw [← glueChkRN_eq lits W 7747 568 lenT]; decide +kernel
theorem okM65 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 1 = true := okB568
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 2 = true := blkChk_join _ _ _ _ _ 568 1 1 h0 okB569
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 3 = true := blkChk_join _ _ _ _ _ 568 2 1 h1 okB570
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 4 = true := blkChk_join _ _ _ _ _ 568 3 1 h2 okB571
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 5 = true := blkChk_join _ _ _ _ _ 568 4 1 h3 okB572
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 6 = true := blkChk_join _ _ _ _ _ 568 5 1 h4 okB573
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 7 = true := blkChk_join _ _ _ _ _ 568 6 1 h5 okB574
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 8 = true := blkChk_join _ _ _ _ _ 568 7 1 h6 okB575
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 9 = true := blkChk_join _ _ _ _ _ 568 8 1 h7 okB576
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 568 10 = true := blkChk_join _ _ _ _ _ 568 9 1 h8 okB577
  exact h9
end E1.C284X
