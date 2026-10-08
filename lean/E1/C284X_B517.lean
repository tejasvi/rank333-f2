module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4906 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4906 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4907 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4907 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4908 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4908 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4909 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4909 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4910 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4910 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG517 : glueChkR lits W 4906 5 = true := by
  rw [← glueChkRN_eq lits W 7747 4906 lenT]; decide +kernel
theorem okM517 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4906 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4906 1 = true := okB4906
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4906 2 = true := blkChk_join _ _ _ _ _ 4906 1 1 h0 okB4907
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4906 3 = true := blkChk_join _ _ _ _ _ 4906 2 1 h1 okB4908
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4906 4 = true := blkChk_join _ _ _ _ _ 4906 3 1 h2 okB4909
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4906 5 = true := blkChk_join _ _ _ _ _ 4906 4 1 h3 okB4910
  exact h4
end E1.C284X
