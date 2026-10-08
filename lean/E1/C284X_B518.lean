module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4911 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4911 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4912 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4912 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4913 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4913 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4914 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4914 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4915 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4915 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG518 : glueChkR lits W 4911 5 = true := by
  rw [← glueChkRN_eq lits W 7747 4911 lenT]; decide +kernel
theorem okM518 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4911 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4911 1 = true := okB4911
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4911 2 = true := blkChk_join _ _ _ _ _ 4911 1 1 h0 okB4912
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4911 3 = true := blkChk_join _ _ _ _ _ 4911 2 1 h1 okB4913
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4911 4 = true := blkChk_join _ _ _ _ _ 4911 3 1 h2 okB4914
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4911 5 = true := blkChk_join _ _ _ _ _ 4911 4 1 h3 okB4915
  exact h4
end E1.C284X
