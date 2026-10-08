module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB379 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 379 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB380 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 380 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB381 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 381 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB382 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 382 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB383 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 383 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB384 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 384 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB385 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 385 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB386 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 386 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG36 : glueChkR lits W 379 8 = true := by
  rw [← glueChkRN_eq lits W 8596 379 lenT]; decide +kernel
theorem okM36 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 379 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 379 1 = true := okB379
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 379 2 = true := blkChk_join _ _ _ _ _ 379 1 1 h0 okB380
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 379 3 = true := blkChk_join _ _ _ _ _ 379 2 1 h1 okB381
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 379 4 = true := blkChk_join _ _ _ _ _ 379 3 1 h2 okB382
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 379 5 = true := blkChk_join _ _ _ _ _ 379 4 1 h3 okB383
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 379 6 = true := blkChk_join _ _ _ _ _ 379 5 1 h4 okB384
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 379 7 = true := blkChk_join _ _ _ _ _ 379 6 1 h5 okB385
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 379 8 = true := blkChk_join _ _ _ _ _ 379 7 1 h6 okB386
  exact h7
end E1.C236X
