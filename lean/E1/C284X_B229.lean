module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2076 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2077 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2077 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2078 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2078 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2079 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2079 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2080 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2080 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2081 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2081 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG229 : glueChkR lits W 2076 6 = true := by
  rw [← glueChkRN_eq lits W 7747 2076 lenT]; decide +kernel
theorem okM229 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2076 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2076 1 = true := okB2076
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2076 2 = true := blkChk_join _ _ _ _ _ 2076 1 1 h0 okB2077
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2076 3 = true := blkChk_join _ _ _ _ _ 2076 2 1 h1 okB2078
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2076 4 = true := blkChk_join _ _ _ _ _ 2076 3 1 h2 okB2079
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2076 5 = true := blkChk_join _ _ _ _ _ 2076 4 1 h3 okB2080
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2076 6 = true := blkChk_join _ _ _ _ _ 2076 5 1 h4 okB2081
  exact h5
end E1.C284X
