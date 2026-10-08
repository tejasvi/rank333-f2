module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7033 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7034 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7034 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7035 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7035 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7036 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7036 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7037 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7037 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7038 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7038 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7039 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7039 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7040 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7040 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7041 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7041 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7042 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7042 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG721 : glueChkR lits W 7033 10 = true := by
  rw [← glueChkRN_eq lits W 7747 7033 lenT]; decide +kernel
theorem okM721 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 1 = true := okB7033
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 2 = true := blkChk_join _ _ _ _ _ 7033 1 1 h0 okB7034
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 3 = true := blkChk_join _ _ _ _ _ 7033 2 1 h1 okB7035
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 4 = true := blkChk_join _ _ _ _ _ 7033 3 1 h2 okB7036
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 5 = true := blkChk_join _ _ _ _ _ 7033 4 1 h3 okB7037
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 6 = true := blkChk_join _ _ _ _ _ 7033 5 1 h4 okB7038
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 7 = true := blkChk_join _ _ _ _ _ 7033 6 1 h5 okB7039
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 8 = true := blkChk_join _ _ _ _ _ 7033 7 1 h6 okB7040
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 9 = true := blkChk_join _ _ _ _ _ 7033 8 1 h7 okB7041
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7033 10 = true := blkChk_join _ _ _ _ _ 7033 9 1 h8 okB7042
  exact h9
end E1.C284X
