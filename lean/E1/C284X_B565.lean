module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5314 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5315 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5315 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5316 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5316 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5317 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5317 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5318 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5318 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5319 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5319 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5320 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5320 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5321 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5321 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5322 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5322 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5323 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5323 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5324 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5324 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5325 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5325 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5326 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5326 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5327 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5327 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5328 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5328 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5329 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5329 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG565 : glueChkR lits W 5314 16 = true := by
  rw [← glueChkRN_eq lits W 7747 5314 lenT]; decide +kernel
theorem okM565 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 16 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 1 = true := okB5314
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 2 = true := blkChk_join _ _ _ _ _ 5314 1 1 h0 okB5315
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 3 = true := blkChk_join _ _ _ _ _ 5314 2 1 h1 okB5316
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 4 = true := blkChk_join _ _ _ _ _ 5314 3 1 h2 okB5317
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 5 = true := blkChk_join _ _ _ _ _ 5314 4 1 h3 okB5318
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 6 = true := blkChk_join _ _ _ _ _ 5314 5 1 h4 okB5319
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 7 = true := blkChk_join _ _ _ _ _ 5314 6 1 h5 okB5320
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 8 = true := blkChk_join _ _ _ _ _ 5314 7 1 h6 okB5321
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 9 = true := blkChk_join _ _ _ _ _ 5314 8 1 h7 okB5322
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 10 = true := blkChk_join _ _ _ _ _ 5314 9 1 h8 okB5323
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 11 = true := blkChk_join _ _ _ _ _ 5314 10 1 h9 okB5324
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 12 = true := blkChk_join _ _ _ _ _ 5314 11 1 h10 okB5325
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 13 = true := blkChk_join _ _ _ _ _ 5314 12 1 h11 okB5326
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 14 = true := blkChk_join _ _ _ _ _ 5314 13 1 h12 okB5327
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 15 = true := blkChk_join _ _ _ _ _ 5314 14 1 h13 okB5328
  have h15 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5314 16 = true := blkChk_join _ _ _ _ _ 5314 15 1 h14 okB5329
  exact h15
end E1.C284X
