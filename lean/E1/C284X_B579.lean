module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5460 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5461 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5461 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5462 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5462 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5463 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5463 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5464 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5464 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5465 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5465 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5466 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5466 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5467 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5467 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5468 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5468 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG579 : glueChkR lits W 5460 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5460 lenT]; decide +kernel
theorem okM579 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 1 = true := okB5460
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 2 = true := blkChk_join _ _ _ _ _ 5460 1 1 h0 okB5461
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 3 = true := blkChk_join _ _ _ _ _ 5460 2 1 h1 okB5462
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 4 = true := blkChk_join _ _ _ _ _ 5460 3 1 h2 okB5463
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 5 = true := blkChk_join _ _ _ _ _ 5460 4 1 h3 okB5464
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 6 = true := blkChk_join _ _ _ _ _ 5460 5 1 h4 okB5465
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 7 = true := blkChk_join _ _ _ _ _ 5460 6 1 h5 okB5466
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 8 = true := blkChk_join _ _ _ _ _ 5460 7 1 h6 okB5467
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5460 9 = true := blkChk_join _ _ _ _ _ 5460 8 1 h7 okB5468
  exact h8
end E1.C284X
