module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3033 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3034 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3034 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3035 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3035 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3036 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3036 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3037 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3037 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3038 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3038 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3039 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3039 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3040 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3040 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3041 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3041 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG327 : glueChkR lits W 3033 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3033 lenT]; decide +kernel
theorem okM327 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 1 = true := okB3033
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 2 = true := blkChk_join _ _ _ _ _ 3033 1 1 h0 okB3034
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 3 = true := blkChk_join _ _ _ _ _ 3033 2 1 h1 okB3035
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 4 = true := blkChk_join _ _ _ _ _ 3033 3 1 h2 okB3036
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 5 = true := blkChk_join _ _ _ _ _ 3033 4 1 h3 okB3037
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 6 = true := blkChk_join _ _ _ _ _ 3033 5 1 h4 okB3038
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 7 = true := blkChk_join _ _ _ _ _ 3033 6 1 h5 okB3039
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 8 = true := blkChk_join _ _ _ _ _ 3033 7 1 h6 okB3040
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3033 9 = true := blkChk_join _ _ _ _ _ 3033 8 1 h7 okB3041
  exact h8
end E1.C284X
