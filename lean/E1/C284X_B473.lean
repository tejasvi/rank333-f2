module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4453 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4454 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4454 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4455 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4455 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4456 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4456 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4457 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4457 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4458 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4458 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4459 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4459 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4460 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4460 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4461 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4461 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4462 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4462 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4463 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4463 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4464 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4464 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG473 : glueChkR lits W 4453 12 = true := by
  rw [← glueChkRN_eq lits W 7747 4453 lenT]; decide +kernel
theorem okM473 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 1 = true := okB4453
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 2 = true := blkChk_join _ _ _ _ _ 4453 1 1 h0 okB4454
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 3 = true := blkChk_join _ _ _ _ _ 4453 2 1 h1 okB4455
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 4 = true := blkChk_join _ _ _ _ _ 4453 3 1 h2 okB4456
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 5 = true := blkChk_join _ _ _ _ _ 4453 4 1 h3 okB4457
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 6 = true := blkChk_join _ _ _ _ _ 4453 5 1 h4 okB4458
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 7 = true := blkChk_join _ _ _ _ _ 4453 6 1 h5 okB4459
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 8 = true := blkChk_join _ _ _ _ _ 4453 7 1 h6 okB4460
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 9 = true := blkChk_join _ _ _ _ _ 4453 8 1 h7 okB4461
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 10 = true := blkChk_join _ _ _ _ _ 4453 9 1 h8 okB4462
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 11 = true := blkChk_join _ _ _ _ _ 4453 10 1 h9 okB4463
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4453 12 = true := blkChk_join _ _ _ _ _ 4453 11 1 h10 okB4464
  exact h11
end E1.C284X
