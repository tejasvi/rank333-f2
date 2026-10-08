module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4620 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4621 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4621 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4622 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4622 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4623 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4623 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4624 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4624 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4625 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4625 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4626 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4626 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4627 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4627 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4628 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4628 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4629 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4629 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4630 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4630 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4631 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4631 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4632 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4632 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG488 : glueChkR lits W 4620 13 = true := by
  rw [← glueChkRN_eq lits W 7747 4620 lenT]; decide +kernel
theorem okM488 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 1 = true := okB4620
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 2 = true := blkChk_join _ _ _ _ _ 4620 1 1 h0 okB4621
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 3 = true := blkChk_join _ _ _ _ _ 4620 2 1 h1 okB4622
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 4 = true := blkChk_join _ _ _ _ _ 4620 3 1 h2 okB4623
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 5 = true := blkChk_join _ _ _ _ _ 4620 4 1 h3 okB4624
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 6 = true := blkChk_join _ _ _ _ _ 4620 5 1 h4 okB4625
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 7 = true := blkChk_join _ _ _ _ _ 4620 6 1 h5 okB4626
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 8 = true := blkChk_join _ _ _ _ _ 4620 7 1 h6 okB4627
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 9 = true := blkChk_join _ _ _ _ _ 4620 8 1 h7 okB4628
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 10 = true := blkChk_join _ _ _ _ _ 4620 9 1 h8 okB4629
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 11 = true := blkChk_join _ _ _ _ _ 4620 10 1 h9 okB4630
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 12 = true := blkChk_join _ _ _ _ _ 4620 11 1 h10 okB4631
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4620 13 = true := blkChk_join _ _ _ _ _ 4620 12 1 h11 okB4632
  exact h12
end E1.C284X
