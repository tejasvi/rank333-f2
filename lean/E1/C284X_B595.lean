module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5627 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5628 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5628 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5629 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5629 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5630 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5630 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5631 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5631 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5632 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5632 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5633 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5633 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5634 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5634 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5635 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5635 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5636 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5636 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG595 : glueChkR lits W 5627 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5627 lenT]; decide +kernel
theorem okM595 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 1 = true := okB5627
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 2 = true := blkChk_join _ _ _ _ _ 5627 1 1 h0 okB5628
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 3 = true := blkChk_join _ _ _ _ _ 5627 2 1 h1 okB5629
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 4 = true := blkChk_join _ _ _ _ _ 5627 3 1 h2 okB5630
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 5 = true := blkChk_join _ _ _ _ _ 5627 4 1 h3 okB5631
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 6 = true := blkChk_join _ _ _ _ _ 5627 5 1 h4 okB5632
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 7 = true := blkChk_join _ _ _ _ _ 5627 6 1 h5 okB5633
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 8 = true := blkChk_join _ _ _ _ _ 5627 7 1 h6 okB5634
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 9 = true := blkChk_join _ _ _ _ _ 5627 8 1 h7 okB5635
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5627 10 = true := blkChk_join _ _ _ _ _ 5627 9 1 h8 okB5636
  exact h9
end E1.C284X
