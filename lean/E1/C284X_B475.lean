module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4475 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4476 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4476 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4477 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4477 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4478 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4478 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4479 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4479 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4480 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4480 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4481 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4481 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4482 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4482 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4483 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4483 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG475 : glueChkR lits W 4475 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4475 lenT]; decide +kernel
theorem okM475 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 1 = true := okB4475
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 2 = true := blkChk_join _ _ _ _ _ 4475 1 1 h0 okB4476
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 3 = true := blkChk_join _ _ _ _ _ 4475 2 1 h1 okB4477
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 4 = true := blkChk_join _ _ _ _ _ 4475 3 1 h2 okB4478
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 5 = true := blkChk_join _ _ _ _ _ 4475 4 1 h3 okB4479
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 6 = true := blkChk_join _ _ _ _ _ 4475 5 1 h4 okB4480
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 7 = true := blkChk_join _ _ _ _ _ 4475 6 1 h5 okB4481
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 8 = true := blkChk_join _ _ _ _ _ 4475 7 1 h6 okB4482
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4475 9 = true := blkChk_join _ _ _ _ _ 4475 8 1 h7 okB4483
  exact h8
end E1.C284X
