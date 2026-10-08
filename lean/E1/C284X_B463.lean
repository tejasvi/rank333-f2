module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4349 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4350 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4350 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4351 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4351 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4352 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4352 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4353 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4353 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4354 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4354 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4355 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4355 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4356 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4356 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4357 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4357 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG463 : glueChkR lits W 4349 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4349 lenT]; decide +kernel
theorem okM463 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 1 = true := okB4349
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 2 = true := blkChk_join _ _ _ _ _ 4349 1 1 h0 okB4350
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 3 = true := blkChk_join _ _ _ _ _ 4349 2 1 h1 okB4351
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 4 = true := blkChk_join _ _ _ _ _ 4349 3 1 h2 okB4352
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 5 = true := blkChk_join _ _ _ _ _ 4349 4 1 h3 okB4353
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 6 = true := blkChk_join _ _ _ _ _ 4349 5 1 h4 okB4354
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 7 = true := blkChk_join _ _ _ _ _ 4349 6 1 h5 okB4355
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 8 = true := blkChk_join _ _ _ _ _ 4349 7 1 h6 okB4356
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4349 9 = true := blkChk_join _ _ _ _ _ 4349 8 1 h7 okB4357
  exact h8
end E1.C284X
