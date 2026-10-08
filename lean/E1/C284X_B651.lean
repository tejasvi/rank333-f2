module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6218 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6219 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6219 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6220 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6220 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6221 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6221 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6222 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6222 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6223 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6223 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6224 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6224 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6225 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6225 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6226 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6226 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG651 : glueChkR lits W 6218 9 = true := by
  rw [← glueChkRN_eq lits W 7747 6218 lenT]; decide +kernel
theorem okM651 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 1 = true := okB6218
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 2 = true := blkChk_join _ _ _ _ _ 6218 1 1 h0 okB6219
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 3 = true := blkChk_join _ _ _ _ _ 6218 2 1 h1 okB6220
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 4 = true := blkChk_join _ _ _ _ _ 6218 3 1 h2 okB6221
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 5 = true := blkChk_join _ _ _ _ _ 6218 4 1 h3 okB6222
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 6 = true := blkChk_join _ _ _ _ _ 6218 5 1 h4 okB6223
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 7 = true := blkChk_join _ _ _ _ _ 6218 6 1 h5 okB6224
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 8 = true := blkChk_join _ _ _ _ _ 6218 7 1 h6 okB6225
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6218 9 = true := blkChk_join _ _ _ _ _ 6218 8 1 h7 okB6226
  exact h8
end E1.C284X
