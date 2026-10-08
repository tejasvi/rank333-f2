module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6404 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6404 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6405 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6405 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6406 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6406 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6407 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6407 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6408 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6408 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6409 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6409 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6410 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6410 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6411 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6411 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG610 : glueChkR lits W 6404 8 = true := by
  rw [← glueChkRN_eq lits W 8596 6404 lenT]; decide +kernel
theorem okM610 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6404 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6404 1 = true := okB6404
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6404 2 = true := blkChk_join _ _ _ _ _ 6404 1 1 h0 okB6405
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6404 3 = true := blkChk_join _ _ _ _ _ 6404 2 1 h1 okB6406
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6404 4 = true := blkChk_join _ _ _ _ _ 6404 3 1 h2 okB6407
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6404 5 = true := blkChk_join _ _ _ _ _ 6404 4 1 h3 okB6408
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6404 6 = true := blkChk_join _ _ _ _ _ 6404 5 1 h4 okB6409
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6404 7 = true := blkChk_join _ _ _ _ _ 6404 6 1 h5 okB6410
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6404 8 = true := blkChk_join _ _ _ _ _ 6404 7 1 h6 okB6411
  exact h7
end E1.C236X
