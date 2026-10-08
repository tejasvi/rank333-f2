module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5289 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5290 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5290 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5291 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5291 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5292 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5292 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5293 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5293 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5294 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5294 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5295 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5295 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5296 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5296 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5297 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5297 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5298 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5298 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5299 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5299 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5300 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5300 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5301 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5301 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5302 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5302 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5303 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5303 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG563 : glueChkR lits W 5289 15 = true := by
  rw [← glueChkRN_eq lits W 7747 5289 lenT]; decide +kernel
theorem okM563 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 15 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 1 = true := okB5289
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 2 = true := blkChk_join _ _ _ _ _ 5289 1 1 h0 okB5290
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 3 = true := blkChk_join _ _ _ _ _ 5289 2 1 h1 okB5291
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 4 = true := blkChk_join _ _ _ _ _ 5289 3 1 h2 okB5292
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 5 = true := blkChk_join _ _ _ _ _ 5289 4 1 h3 okB5293
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 6 = true := blkChk_join _ _ _ _ _ 5289 5 1 h4 okB5294
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 7 = true := blkChk_join _ _ _ _ _ 5289 6 1 h5 okB5295
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 8 = true := blkChk_join _ _ _ _ _ 5289 7 1 h6 okB5296
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 9 = true := blkChk_join _ _ _ _ _ 5289 8 1 h7 okB5297
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 10 = true := blkChk_join _ _ _ _ _ 5289 9 1 h8 okB5298
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 11 = true := blkChk_join _ _ _ _ _ 5289 10 1 h9 okB5299
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 12 = true := blkChk_join _ _ _ _ _ 5289 11 1 h10 okB5300
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 13 = true := blkChk_join _ _ _ _ _ 5289 12 1 h11 okB5301
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 14 = true := blkChk_join _ _ _ _ _ 5289 13 1 h12 okB5302
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5289 15 = true := blkChk_join _ _ _ _ _ 5289 14 1 h13 okB5303
  exact h14
end E1.C284X
