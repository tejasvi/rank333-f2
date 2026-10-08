module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5268 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5269 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5269 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5270 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5270 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5271 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5271 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5272 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5272 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5273 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5273 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5274 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5274 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5275 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5275 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5276 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5276 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5277 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5277 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5278 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5278 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG561 : glueChkR lits W 5268 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5268 lenT]; decide +kernel
theorem okM561 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 1 = true := okB5268
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 2 = true := blkChk_join _ _ _ _ _ 5268 1 1 h0 okB5269
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 3 = true := blkChk_join _ _ _ _ _ 5268 2 1 h1 okB5270
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 4 = true := blkChk_join _ _ _ _ _ 5268 3 1 h2 okB5271
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 5 = true := blkChk_join _ _ _ _ _ 5268 4 1 h3 okB5272
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 6 = true := blkChk_join _ _ _ _ _ 5268 5 1 h4 okB5273
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 7 = true := blkChk_join _ _ _ _ _ 5268 6 1 h5 okB5274
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 8 = true := blkChk_join _ _ _ _ _ 5268 7 1 h6 okB5275
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 9 = true := blkChk_join _ _ _ _ _ 5268 8 1 h7 okB5276
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 10 = true := blkChk_join _ _ _ _ _ 5268 9 1 h8 okB5277
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5268 11 = true := blkChk_join _ _ _ _ _ 5268 10 1 h9 okB5278
  exact h10
end E1.C284X
