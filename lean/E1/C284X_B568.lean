module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5352 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5353 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5353 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5354 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5354 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5355 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5355 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5356 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5356 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5357 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5357 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5358 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5358 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5359 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5359 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5360 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5360 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG568 : glueChkR lits W 5352 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5352 lenT]; decide +kernel
theorem okM568 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 1 = true := okB5352
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 2 = true := blkChk_join _ _ _ _ _ 5352 1 1 h0 okB5353
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 3 = true := blkChk_join _ _ _ _ _ 5352 2 1 h1 okB5354
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 4 = true := blkChk_join _ _ _ _ _ 5352 3 1 h2 okB5355
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 5 = true := blkChk_join _ _ _ _ _ 5352 4 1 h3 okB5356
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 6 = true := blkChk_join _ _ _ _ _ 5352 5 1 h4 okB5357
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 7 = true := blkChk_join _ _ _ _ _ 5352 6 1 h5 okB5358
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 8 = true := blkChk_join _ _ _ _ _ 5352 7 1 h6 okB5359
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5352 9 = true := blkChk_join _ _ _ _ _ 5352 8 1 h7 okB5360
  exact h8
end E1.C284X
