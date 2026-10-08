module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5408 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5409 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5409 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5410 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5410 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5411 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5411 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5412 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5412 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5413 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5413 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5414 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5414 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5415 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5415 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5416 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5416 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5417 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5417 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5418 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5418 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG574 : glueChkR lits W 5408 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5408 lenT]; decide +kernel
theorem okM574 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 1 = true := okB5408
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 2 = true := blkChk_join _ _ _ _ _ 5408 1 1 h0 okB5409
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 3 = true := blkChk_join _ _ _ _ _ 5408 2 1 h1 okB5410
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 4 = true := blkChk_join _ _ _ _ _ 5408 3 1 h2 okB5411
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 5 = true := blkChk_join _ _ _ _ _ 5408 4 1 h3 okB5412
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 6 = true := blkChk_join _ _ _ _ _ 5408 5 1 h4 okB5413
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 7 = true := blkChk_join _ _ _ _ _ 5408 6 1 h5 okB5414
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 8 = true := blkChk_join _ _ _ _ _ 5408 7 1 h6 okB5415
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 9 = true := blkChk_join _ _ _ _ _ 5408 8 1 h7 okB5416
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 10 = true := blkChk_join _ _ _ _ _ 5408 9 1 h8 okB5417
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5408 11 = true := blkChk_join _ _ _ _ _ 5408 10 1 h9 okB5418
  exact h10
end E1.C284X
