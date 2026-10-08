module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5363 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5364 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5364 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5365 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5365 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5366 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5366 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5367 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5367 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5368 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5368 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5369 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5369 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5370 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5370 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5371 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5371 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5372 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5372 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG523 : glueChkR lits W 5363 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5363 lenT]; decide +kernel
theorem okM523 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 1 = true := okB5363
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 2 = true := blkChk_join _ _ _ _ _ 5363 1 1 h0 okB5364
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 3 = true := blkChk_join _ _ _ _ _ 5363 2 1 h1 okB5365
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 4 = true := blkChk_join _ _ _ _ _ 5363 3 1 h2 okB5366
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 5 = true := blkChk_join _ _ _ _ _ 5363 4 1 h3 okB5367
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 6 = true := blkChk_join _ _ _ _ _ 5363 5 1 h4 okB5368
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 7 = true := blkChk_join _ _ _ _ _ 5363 6 1 h5 okB5369
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 8 = true := blkChk_join _ _ _ _ _ 5363 7 1 h6 okB5370
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 9 = true := blkChk_join _ _ _ _ _ 5363 8 1 h7 okB5371
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5363 10 = true := blkChk_join _ _ _ _ _ 5363 9 1 h8 okB5372
  exact h9
end E1.C236X
