module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5381 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5382 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5382 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5383 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5383 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5384 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5384 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5385 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5385 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5386 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5386 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5387 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5387 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5388 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5388 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5389 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5389 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5390 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5390 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG525 : glueChkR lits W 5381 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5381 lenT]; decide +kernel
theorem okM525 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 1 = true := okB5381
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 2 = true := blkChk_join _ _ _ _ _ 5381 1 1 h0 okB5382
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 3 = true := blkChk_join _ _ _ _ _ 5381 2 1 h1 okB5383
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 4 = true := blkChk_join _ _ _ _ _ 5381 3 1 h2 okB5384
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 5 = true := blkChk_join _ _ _ _ _ 5381 4 1 h3 okB5385
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 6 = true := blkChk_join _ _ _ _ _ 5381 5 1 h4 okB5386
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 7 = true := blkChk_join _ _ _ _ _ 5381 6 1 h5 okB5387
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 8 = true := blkChk_join _ _ _ _ _ 5381 7 1 h6 okB5388
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 9 = true := blkChk_join _ _ _ _ _ 5381 8 1 h7 okB5389
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5381 10 = true := blkChk_join _ _ _ _ _ 5381 9 1 h8 okB5390
  exact h9
end E1.C236X
