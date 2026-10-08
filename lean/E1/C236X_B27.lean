module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB285 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB286 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 286 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB287 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 287 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB288 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 288 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB289 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 289 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB290 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 290 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB291 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 291 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB292 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 292 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB293 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 293 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB294 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 294 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG27 : glueChkR lits W 285 10 = true := by
  rw [← glueChkRN_eq lits W 8596 285 lenT]; decide +kernel
theorem okM27 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 1 = true := okB285
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 2 = true := blkChk_join _ _ _ _ _ 285 1 1 h0 okB286
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 3 = true := blkChk_join _ _ _ _ _ 285 2 1 h1 okB287
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 4 = true := blkChk_join _ _ _ _ _ 285 3 1 h2 okB288
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 5 = true := blkChk_join _ _ _ _ _ 285 4 1 h3 okB289
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 6 = true := blkChk_join _ _ _ _ _ 285 5 1 h4 okB290
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 7 = true := blkChk_join _ _ _ _ _ 285 6 1 h5 okB291
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 8 = true := blkChk_join _ _ _ _ _ 285 7 1 h6 okB292
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 9 = true := blkChk_join _ _ _ _ _ 285 8 1 h7 okB293
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 285 10 = true := blkChk_join _ _ _ _ _ 285 9 1 h8 okB294
  exact h9
end E1.C236X
