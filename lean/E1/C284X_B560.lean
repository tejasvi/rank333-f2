module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5260 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5260 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5261 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5261 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5262 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5262 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5263 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5263 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5264 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5264 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5265 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5265 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5266 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5266 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5267 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5267 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG560 : glueChkR lits W 5260 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5260 lenT]; decide +kernel
theorem okM560 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5260 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5260 1 = true := okB5260
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5260 2 = true := blkChk_join _ _ _ _ _ 5260 1 1 h0 okB5261
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5260 3 = true := blkChk_join _ _ _ _ _ 5260 2 1 h1 okB5262
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5260 4 = true := blkChk_join _ _ _ _ _ 5260 3 1 h2 okB5263
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5260 5 = true := blkChk_join _ _ _ _ _ 5260 4 1 h3 okB5264
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5260 6 = true := blkChk_join _ _ _ _ _ 5260 5 1 h4 okB5265
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5260 7 = true := blkChk_join _ _ _ _ _ 5260 6 1 h5 okB5266
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5260 8 = true := blkChk_join _ _ _ _ _ 5260 7 1 h6 okB5267
  exact h7
end E1.C284X
