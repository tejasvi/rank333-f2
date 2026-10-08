module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5350 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5351 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5351 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5352 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5352 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5353 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5353 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5354 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5354 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5355 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5355 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5356 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5356 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5357 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5357 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5358 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5358 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5359 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5359 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5360 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5360 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5361 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5361 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5362 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5362 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG522 : glueChkR lits W 5350 13 = true := by
  rw [← glueChkRN_eq lits W 8596 5350 lenT]; decide +kernel
theorem okM522 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 13 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 1 = true := okB5350
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 2 = true := blkChk_join _ _ _ _ _ 5350 1 1 h0 okB5351
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 3 = true := blkChk_join _ _ _ _ _ 5350 2 1 h1 okB5352
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 4 = true := blkChk_join _ _ _ _ _ 5350 3 1 h2 okB5353
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 5 = true := blkChk_join _ _ _ _ _ 5350 4 1 h3 okB5354
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 6 = true := blkChk_join _ _ _ _ _ 5350 5 1 h4 okB5355
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 7 = true := blkChk_join _ _ _ _ _ 5350 6 1 h5 okB5356
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 8 = true := blkChk_join _ _ _ _ _ 5350 7 1 h6 okB5357
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 9 = true := blkChk_join _ _ _ _ _ 5350 8 1 h7 okB5358
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 10 = true := blkChk_join _ _ _ _ _ 5350 9 1 h8 okB5359
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 11 = true := blkChk_join _ _ _ _ _ 5350 10 1 h9 okB5360
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 12 = true := blkChk_join _ _ _ _ _ 5350 11 1 h10 okB5361
  have h12 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5350 13 = true := blkChk_join _ _ _ _ _ 5350 12 1 h11 okB5362
  exact h12
end E1.C236X
