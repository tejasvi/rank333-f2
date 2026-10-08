module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5285 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5286 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5286 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5287 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5287 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5288 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5288 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5289 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5289 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5290 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5290 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5291 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5291 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5292 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5292 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5293 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5293 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG516 : glueChkR lits W 5285 9 = true := by
  rw [← glueChkRN_eq lits W 8596 5285 lenT]; decide +kernel
theorem okM516 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 1 = true := okB5285
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 2 = true := blkChk_join _ _ _ _ _ 5285 1 1 h0 okB5286
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 3 = true := blkChk_join _ _ _ _ _ 5285 2 1 h1 okB5287
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 4 = true := blkChk_join _ _ _ _ _ 5285 3 1 h2 okB5288
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 5 = true := blkChk_join _ _ _ _ _ 5285 4 1 h3 okB5289
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 6 = true := blkChk_join _ _ _ _ _ 5285 5 1 h4 okB5290
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 7 = true := blkChk_join _ _ _ _ _ 5285 6 1 h5 okB5291
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 8 = true := blkChk_join _ _ _ _ _ 5285 7 1 h6 okB5292
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5285 9 = true := blkChk_join _ _ _ _ _ 5285 8 1 h7 okB5293
  exact h8
end E1.C236X
