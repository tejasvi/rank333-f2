module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4036 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4036 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4037 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4037 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4038 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4038 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4039 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4039 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4040 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4040 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4041 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4041 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4042 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4042 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4043 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4043 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG428 : glueChkR lits W 4036 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4036 lenT]; decide +kernel
theorem okM428 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4036 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4036 1 = true := okB4036
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4036 2 = true := blkChk_join _ _ _ _ _ 4036 1 1 h0 okB4037
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4036 3 = true := blkChk_join _ _ _ _ _ 4036 2 1 h1 okB4038
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4036 4 = true := blkChk_join _ _ _ _ _ 4036 3 1 h2 okB4039
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4036 5 = true := blkChk_join _ _ _ _ _ 4036 4 1 h3 okB4040
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4036 6 = true := blkChk_join _ _ _ _ _ 4036 5 1 h4 okB4041
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4036 7 = true := blkChk_join _ _ _ _ _ 4036 6 1 h5 okB4042
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4036 8 = true := blkChk_join _ _ _ _ _ 4036 7 1 h6 okB4043
  exact h7
end E1.C284X
