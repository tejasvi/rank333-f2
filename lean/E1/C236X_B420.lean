module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4284 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4285 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4285 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4286 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4286 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4287 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4287 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4288 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4288 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4289 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4289 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4290 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4290 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4291 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4291 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4292 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4292 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4293 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4293 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4294 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4294 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4295 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4295 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG420 : glueChkR lits W 4284 12 = true := by
  rw [← glueChkRN_eq lits W 8596 4284 lenT]; decide +kernel
theorem okM420 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 1 = true := okB4284
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 2 = true := blkChk_join _ _ _ _ _ 4284 1 1 h0 okB4285
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 3 = true := blkChk_join _ _ _ _ _ 4284 2 1 h1 okB4286
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 4 = true := blkChk_join _ _ _ _ _ 4284 3 1 h2 okB4287
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 5 = true := blkChk_join _ _ _ _ _ 4284 4 1 h3 okB4288
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 6 = true := blkChk_join _ _ _ _ _ 4284 5 1 h4 okB4289
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 7 = true := blkChk_join _ _ _ _ _ 4284 6 1 h5 okB4290
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 8 = true := blkChk_join _ _ _ _ _ 4284 7 1 h6 okB4291
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 9 = true := blkChk_join _ _ _ _ _ 4284 8 1 h7 okB4292
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 10 = true := blkChk_join _ _ _ _ _ 4284 9 1 h8 okB4293
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 11 = true := blkChk_join _ _ _ _ _ 4284 10 1 h9 okB4294
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4284 12 = true := blkChk_join _ _ _ _ _ 4284 11 1 h10 okB4295
  exact h11
end E1.C236X
