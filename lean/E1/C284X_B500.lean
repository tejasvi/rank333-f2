module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4734 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4735 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4735 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4736 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4736 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4737 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4737 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4738 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4738 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4739 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4739 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4740 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4740 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4741 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4741 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4742 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4742 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4743 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4743 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG500 : glueChkR lits W 4734 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4734 lenT]; decide +kernel
theorem okM500 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 1 = true := okB4734
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 2 = true := blkChk_join _ _ _ _ _ 4734 1 1 h0 okB4735
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 3 = true := blkChk_join _ _ _ _ _ 4734 2 1 h1 okB4736
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 4 = true := blkChk_join _ _ _ _ _ 4734 3 1 h2 okB4737
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 5 = true := blkChk_join _ _ _ _ _ 4734 4 1 h3 okB4738
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 6 = true := blkChk_join _ _ _ _ _ 4734 5 1 h4 okB4739
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 7 = true := blkChk_join _ _ _ _ _ 4734 6 1 h5 okB4740
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 8 = true := blkChk_join _ _ _ _ _ 4734 7 1 h6 okB4741
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 9 = true := blkChk_join _ _ _ _ _ 4734 8 1 h7 okB4742
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4734 10 = true := blkChk_join _ _ _ _ _ 4734 9 1 h8 okB4743
  exact h9
end E1.C284X
