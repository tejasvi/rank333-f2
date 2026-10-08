module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB434 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 434 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB435 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 435 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB436 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 436 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB437 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 437 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB438 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 438 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB439 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 439 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG49 : glueChkR lits W 434 6 = true := by
  rw [← glueChkRN_eq lits W 7747 434 lenT]; decide +kernel
theorem okM49 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 434 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 434 1 = true := okB434
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 434 2 = true := blkChk_join _ _ _ _ _ 434 1 1 h0 okB435
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 434 3 = true := blkChk_join _ _ _ _ _ 434 2 1 h1 okB436
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 434 4 = true := blkChk_join _ _ _ _ _ 434 3 1 h2 okB437
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 434 5 = true := blkChk_join _ _ _ _ _ 434 4 1 h3 okB438
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 434 6 = true := blkChk_join _ _ _ _ _ 434 5 1 h4 okB439
  exact h5
end E1.C284X
