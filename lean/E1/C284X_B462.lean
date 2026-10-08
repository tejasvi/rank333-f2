module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4341 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4341 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4342 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4342 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4343 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4343 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4344 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4344 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4345 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4345 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4346 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4346 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4347 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4347 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4348 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4348 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG462 : glueChkR lits W 4341 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4341 lenT]; decide +kernel
theorem okM462 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4341 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4341 1 = true := okB4341
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4341 2 = true := blkChk_join _ _ _ _ _ 4341 1 1 h0 okB4342
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4341 3 = true := blkChk_join _ _ _ _ _ 4341 2 1 h1 okB4343
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4341 4 = true := blkChk_join _ _ _ _ _ 4341 3 1 h2 okB4344
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4341 5 = true := blkChk_join _ _ _ _ _ 4341 4 1 h3 okB4345
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4341 6 = true := blkChk_join _ _ _ _ _ 4341 5 1 h4 okB4346
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4341 7 = true := blkChk_join _ _ _ _ _ 4341 6 1 h5 okB4347
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4341 8 = true := blkChk_join _ _ _ _ _ 4341 7 1 h6 okB4348
  exact h7
end E1.C284X
