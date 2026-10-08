module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5495 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5495 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5496 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5496 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5497 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5497 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5498 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5498 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5499 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5499 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5500 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5500 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG536 : glueChkR lits W 5495 6 = true := by
  rw [← glueChkRN_eq lits W 8596 5495 lenT]; decide +kernel
theorem okM536 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5495 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5495 1 = true := okB5495
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5495 2 = true := blkChk_join _ _ _ _ _ 5495 1 1 h0 okB5496
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5495 3 = true := blkChk_join _ _ _ _ _ 5495 2 1 h1 okB5497
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5495 4 = true := blkChk_join _ _ _ _ _ 5495 3 1 h2 okB5498
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5495 5 = true := blkChk_join _ _ _ _ _ 5495 4 1 h3 okB5499
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5495 6 = true := blkChk_join _ _ _ _ _ 5495 5 1 h4 okB5500
  exact h5
end E1.C236X
