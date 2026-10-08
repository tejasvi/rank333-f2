module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4367 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4368 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4368 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4369 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4369 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4370 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4370 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4371 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4371 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4372 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4372 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4373 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4373 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4374 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4374 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4375 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4375 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4376 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4376 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG465 : glueChkR lits W 4367 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4367 lenT]; decide +kernel
theorem okM465 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 1 = true := okB4367
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 2 = true := blkChk_join _ _ _ _ _ 4367 1 1 h0 okB4368
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 3 = true := blkChk_join _ _ _ _ _ 4367 2 1 h1 okB4369
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 4 = true := blkChk_join _ _ _ _ _ 4367 3 1 h2 okB4370
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 5 = true := blkChk_join _ _ _ _ _ 4367 4 1 h3 okB4371
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 6 = true := blkChk_join _ _ _ _ _ 4367 5 1 h4 okB4372
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 7 = true := blkChk_join _ _ _ _ _ 4367 6 1 h5 okB4373
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 8 = true := blkChk_join _ _ _ _ _ 4367 7 1 h6 okB4374
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 9 = true := blkChk_join _ _ _ _ _ 4367 8 1 h7 okB4375
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4367 10 = true := blkChk_join _ _ _ _ _ 4367 9 1 h8 okB4376
  exact h9
end E1.C284X
