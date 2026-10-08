module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB327 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 327 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB328 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 328 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB329 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 329 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB330 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 330 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB331 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 331 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB332 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 332 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB333 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 333 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB334 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 334 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG31 : glueChkR lits W 327 8 = true := by
  rw [← glueChkRN_eq lits W 8596 327 lenT]; decide +kernel
theorem okM31 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 327 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 327 1 = true := okB327
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 327 2 = true := blkChk_join _ _ _ _ _ 327 1 1 h0 okB328
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 327 3 = true := blkChk_join _ _ _ _ _ 327 2 1 h1 okB329
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 327 4 = true := blkChk_join _ _ _ _ _ 327 3 1 h2 okB330
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 327 5 = true := blkChk_join _ _ _ _ _ 327 4 1 h3 okB331
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 327 6 = true := blkChk_join _ _ _ _ _ 327 5 1 h4 okB332
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 327 7 = true := blkChk_join _ _ _ _ _ 327 6 1 h5 okB333
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 327 8 = true := blkChk_join _ _ _ _ _ 327 7 1 h6 okB334
  exact h7
end E1.C236X
