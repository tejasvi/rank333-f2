module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6385 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6386 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6386 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6387 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6387 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6388 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6388 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6389 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6389 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6390 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6390 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6391 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6391 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6392 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6392 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6393 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6393 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6394 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6394 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6395 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6395 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6396 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6396 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG665 : glueChkR lits W 6385 12 = true := by
  rw [← glueChkRN_eq lits W 7747 6385 lenT]; decide +kernel
theorem okM665 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 1 = true := okB6385
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 2 = true := blkChk_join _ _ _ _ _ 6385 1 1 h0 okB6386
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 3 = true := blkChk_join _ _ _ _ _ 6385 2 1 h1 okB6387
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 4 = true := blkChk_join _ _ _ _ _ 6385 3 1 h2 okB6388
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 5 = true := blkChk_join _ _ _ _ _ 6385 4 1 h3 okB6389
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 6 = true := blkChk_join _ _ _ _ _ 6385 5 1 h4 okB6390
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 7 = true := blkChk_join _ _ _ _ _ 6385 6 1 h5 okB6391
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 8 = true := blkChk_join _ _ _ _ _ 6385 7 1 h6 okB6392
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 9 = true := blkChk_join _ _ _ _ _ 6385 8 1 h7 okB6393
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 10 = true := blkChk_join _ _ _ _ _ 6385 9 1 h8 okB6394
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 11 = true := blkChk_join _ _ _ _ _ 6385 10 1 h9 okB6395
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6385 12 = true := blkChk_join _ _ _ _ _ 6385 11 1 h10 okB6396
  exact h11
end E1.C284X
