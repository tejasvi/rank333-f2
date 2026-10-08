module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4929 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4929 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4930 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4930 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4931 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4931 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4932 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4932 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4933 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4933 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4934 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4934 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4935 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4935 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4936 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4936 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG521 : glueChkR lits W 4929 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4929 lenT]; decide +kernel
theorem okM521 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4929 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4929 1 = true := okB4929
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4929 2 = true := blkChk_join _ _ _ _ _ 4929 1 1 h0 okB4930
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4929 3 = true := blkChk_join _ _ _ _ _ 4929 2 1 h1 okB4931
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4929 4 = true := blkChk_join _ _ _ _ _ 4929 3 1 h2 okB4932
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4929 5 = true := blkChk_join _ _ _ _ _ 4929 4 1 h3 okB4933
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4929 6 = true := blkChk_join _ _ _ _ _ 4929 5 1 h4 okB4934
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4929 7 = true := blkChk_join _ _ _ _ _ 4929 6 1 h5 okB4935
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4929 8 = true := blkChk_join _ _ _ _ _ 4929 7 1 h6 okB4936
  exact h7
end E1.C284X
