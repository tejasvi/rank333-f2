module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1036 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1036 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1037 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1037 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1038 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1038 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1039 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1039 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1040 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1040 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1041 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1041 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG111 : glueChkR lits W 1036 6 = true := by
  rw [← glueChkRN_eq lits W 7747 1036 lenT]; decide +kernel
theorem okM111 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1036 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1036 1 = true := okB1036
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1036 2 = true := blkChk_join _ _ _ _ _ 1036 1 1 h0 okB1037
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1036 3 = true := blkChk_join _ _ _ _ _ 1036 2 1 h1 okB1038
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1036 4 = true := blkChk_join _ _ _ _ _ 1036 3 1 h2 okB1039
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1036 5 = true := blkChk_join _ _ _ _ _ 1036 4 1 h3 okB1040
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1036 6 = true := blkChk_join _ _ _ _ _ 1036 5 1 h4 okB1041
  exact h5
end E1.C284X
