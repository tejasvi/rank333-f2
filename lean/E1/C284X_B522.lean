module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4937 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4937 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4938 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4938 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4939 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4939 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4940 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4940 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4941 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4941 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG522 : glueChkR lits W 4937 5 = true := by
  rw [← glueChkRN_eq lits W 7747 4937 lenT]; decide +kernel
theorem okM522 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4937 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4937 1 = true := okB4937
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4937 2 = true := blkChk_join _ _ _ _ _ 4937 1 1 h0 okB4938
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4937 3 = true := blkChk_join _ _ _ _ _ 4937 2 1 h1 okB4939
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4937 4 = true := blkChk_join _ _ _ _ _ 4937 3 1 h2 okB4940
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4937 5 = true := blkChk_join _ _ _ _ _ 4937 4 1 h3 okB4941
  exact h4
end E1.C284X
