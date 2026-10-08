module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6261 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6262 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6262 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6263 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6263 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6264 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6264 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6265 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6265 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6266 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6266 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6267 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6267 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6268 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6268 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6269 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6269 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6270 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6270 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6271 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6271 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6272 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6272 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG655 : glueChkR lits W 6261 12 = true := by
  rw [← glueChkRN_eq lits W 7747 6261 lenT]; decide +kernel
theorem okM655 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 1 = true := okB6261
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 2 = true := blkChk_join _ _ _ _ _ 6261 1 1 h0 okB6262
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 3 = true := blkChk_join _ _ _ _ _ 6261 2 1 h1 okB6263
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 4 = true := blkChk_join _ _ _ _ _ 6261 3 1 h2 okB6264
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 5 = true := blkChk_join _ _ _ _ _ 6261 4 1 h3 okB6265
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 6 = true := blkChk_join _ _ _ _ _ 6261 5 1 h4 okB6266
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 7 = true := blkChk_join _ _ _ _ _ 6261 6 1 h5 okB6267
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 8 = true := blkChk_join _ _ _ _ _ 6261 7 1 h6 okB6268
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 9 = true := blkChk_join _ _ _ _ _ 6261 8 1 h7 okB6269
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 10 = true := blkChk_join _ _ _ _ _ 6261 9 1 h8 okB6270
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 11 = true := blkChk_join _ _ _ _ _ 6261 10 1 h9 okB6271
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6261 12 = true := blkChk_join _ _ _ _ _ 6261 11 1 h10 okB6272
  exact h11
end E1.C284X
