module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5275 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5276 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5276 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5277 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5277 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5278 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5278 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5279 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5279 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5280 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5280 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5281 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5281 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5282 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5282 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5283 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5283 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5284 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5284 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG515 : glueChkR lits W 5275 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5275 lenT]; decide +kernel
theorem okM515 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 1 = true := okB5275
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 2 = true := blkChk_join _ _ _ _ _ 5275 1 1 h0 okB5276
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 3 = true := blkChk_join _ _ _ _ _ 5275 2 1 h1 okB5277
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 4 = true := blkChk_join _ _ _ _ _ 5275 3 1 h2 okB5278
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 5 = true := blkChk_join _ _ _ _ _ 5275 4 1 h3 okB5279
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 6 = true := blkChk_join _ _ _ _ _ 5275 5 1 h4 okB5280
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 7 = true := blkChk_join _ _ _ _ _ 5275 6 1 h5 okB5281
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 8 = true := blkChk_join _ _ _ _ _ 5275 7 1 h6 okB5282
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 9 = true := blkChk_join _ _ _ _ _ 5275 8 1 h7 okB5283
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5275 10 = true := blkChk_join _ _ _ _ _ 5275 9 1 h8 okB5284
  exact h9
end E1.C236X
