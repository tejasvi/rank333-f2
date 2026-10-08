module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5252 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5252 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5253 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5253 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5254 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5254 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5255 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5255 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5256 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5256 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5257 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5257 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5258 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5258 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5259 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5259 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG559 : glueChkR lits W 5252 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5252 lenT]; decide +kernel
theorem okM559 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5252 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5252 1 = true := okB5252
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5252 2 = true := blkChk_join _ _ _ _ _ 5252 1 1 h0 okB5253
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5252 3 = true := blkChk_join _ _ _ _ _ 5252 2 1 h1 okB5254
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5252 4 = true := blkChk_join _ _ _ _ _ 5252 3 1 h2 okB5255
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5252 5 = true := blkChk_join _ _ _ _ _ 5252 4 1 h3 okB5256
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5252 6 = true := blkChk_join _ _ _ _ _ 5252 5 1 h4 okB5257
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5252 7 = true := blkChk_join _ _ _ _ _ 5252 6 1 h5 okB5258
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5252 8 = true := blkChk_join _ _ _ _ _ 5252 7 1 h6 okB5259
  exact h7
end E1.C284X
