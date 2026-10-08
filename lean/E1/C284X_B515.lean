module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4898 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4899 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4900 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4901 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG515 : glueChkR lits W 4898 4 = true := by
  rw [← glueChkRN_eq lits W 7747 4898 lenT]; decide +kernel
theorem okM515 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4898 4 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4898 1 = true := okB4898
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4898 2 = true := blkChk_join _ _ _ _ _ 4898 1 1 h0 okB4899
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4898 3 = true := blkChk_join _ _ _ _ _ 4898 2 1 h1 okB4900
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4898 4 = true := blkChk_join _ _ _ _ _ 4898 3 1 h2 okB4901
  exact h3
end E1.C284X
