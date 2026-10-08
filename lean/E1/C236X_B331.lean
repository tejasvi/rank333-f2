module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3373 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3374 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3374 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3375 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3375 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3376 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3376 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3377 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3377 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3378 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3378 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3379 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3379 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3380 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3380 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3381 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3381 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG331 : glueChkR lits W 3373 9 = true := by
  rw [← glueChkRN_eq lits W 8596 3373 lenT]; decide +kernel
theorem okM331 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 1 = true := okB3373
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 2 = true := blkChk_join _ _ _ _ _ 3373 1 1 h0 okB3374
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 3 = true := blkChk_join _ _ _ _ _ 3373 2 1 h1 okB3375
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 4 = true := blkChk_join _ _ _ _ _ 3373 3 1 h2 okB3376
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 5 = true := blkChk_join _ _ _ _ _ 3373 4 1 h3 okB3377
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 6 = true := blkChk_join _ _ _ _ _ 3373 5 1 h4 okB3378
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 7 = true := blkChk_join _ _ _ _ _ 3373 6 1 h5 okB3379
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 8 = true := blkChk_join _ _ _ _ _ 3373 7 1 h6 okB3380
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3373 9 = true := blkChk_join _ _ _ _ _ 3373 8 1 h7 okB3381
  exact h8
end E1.C236X
