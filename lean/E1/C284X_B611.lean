module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5795 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5796 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5796 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5797 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5797 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5798 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5798 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5799 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5799 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5800 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5800 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5801 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5801 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5802 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5802 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5803 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5803 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5804 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5804 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5805 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5805 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG611 : glueChkR lits W 5795 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5795 lenT]; decide +kernel
theorem okM611 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 1 = true := okB5795
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 2 = true := blkChk_join _ _ _ _ _ 5795 1 1 h0 okB5796
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 3 = true := blkChk_join _ _ _ _ _ 5795 2 1 h1 okB5797
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 4 = true := blkChk_join _ _ _ _ _ 5795 3 1 h2 okB5798
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 5 = true := blkChk_join _ _ _ _ _ 5795 4 1 h3 okB5799
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 6 = true := blkChk_join _ _ _ _ _ 5795 5 1 h4 okB5800
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 7 = true := blkChk_join _ _ _ _ _ 5795 6 1 h5 okB5801
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 8 = true := blkChk_join _ _ _ _ _ 5795 7 1 h6 okB5802
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 9 = true := blkChk_join _ _ _ _ _ 5795 8 1 h7 okB5803
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 10 = true := blkChk_join _ _ _ _ _ 5795 9 1 h8 okB5804
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5795 11 = true := blkChk_join _ _ _ _ _ 5795 10 1 h9 okB5805
  exact h10
end E1.C284X
