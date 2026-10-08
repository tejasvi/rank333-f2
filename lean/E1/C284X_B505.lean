module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4787 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4788 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4788 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4789 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4789 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4790 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4790 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4791 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4791 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4792 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4792 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4793 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4793 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4794 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4794 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4795 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4795 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4796 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4796 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4797 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4797 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG505 : glueChkR lits W 4787 11 = true := by
  rw [← glueChkRN_eq lits W 7747 4787 lenT]; decide +kernel
theorem okM505 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 1 = true := okB4787
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 2 = true := blkChk_join _ _ _ _ _ 4787 1 1 h0 okB4788
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 3 = true := blkChk_join _ _ _ _ _ 4787 2 1 h1 okB4789
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 4 = true := blkChk_join _ _ _ _ _ 4787 3 1 h2 okB4790
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 5 = true := blkChk_join _ _ _ _ _ 4787 4 1 h3 okB4791
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 6 = true := blkChk_join _ _ _ _ _ 4787 5 1 h4 okB4792
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 7 = true := blkChk_join _ _ _ _ _ 4787 6 1 h5 okB4793
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 8 = true := blkChk_join _ _ _ _ _ 4787 7 1 h6 okB4794
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 9 = true := blkChk_join _ _ _ _ _ 4787 8 1 h7 okB4795
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 10 = true := blkChk_join _ _ _ _ _ 4787 9 1 h8 okB4796
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4787 11 = true := blkChk_join _ _ _ _ _ 4787 10 1 h9 okB4797
  exact h10
end E1.C284X
