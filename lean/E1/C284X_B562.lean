module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5279 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5280 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5280 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5281 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5281 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5282 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5282 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5283 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5283 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5284 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5284 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5285 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5285 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5286 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5286 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5287 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5287 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5288 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5288 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG562 : glueChkR lits W 5279 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5279 lenT]; decide +kernel
theorem okM562 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 1 = true := okB5279
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 2 = true := blkChk_join _ _ _ _ _ 5279 1 1 h0 okB5280
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 3 = true := blkChk_join _ _ _ _ _ 5279 2 1 h1 okB5281
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 4 = true := blkChk_join _ _ _ _ _ 5279 3 1 h2 okB5282
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 5 = true := blkChk_join _ _ _ _ _ 5279 4 1 h3 okB5283
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 6 = true := blkChk_join _ _ _ _ _ 5279 5 1 h4 okB5284
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 7 = true := blkChk_join _ _ _ _ _ 5279 6 1 h5 okB5285
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 8 = true := blkChk_join _ _ _ _ _ 5279 7 1 h6 okB5286
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 9 = true := blkChk_join _ _ _ _ _ 5279 8 1 h7 okB5287
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5279 10 = true := blkChk_join _ _ _ _ _ 5279 9 1 h8 okB5288
  exact h9
end E1.C284X
