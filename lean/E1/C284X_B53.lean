module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB462 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB463 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 463 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB464 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 464 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB465 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 465 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB466 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 466 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB467 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 467 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB468 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 468 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB469 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 469 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB470 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 470 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG53 : glueChkR lits W 462 9 = true := by
  rw [← glueChkRN_eq lits W 7747 462 lenT]; decide +kernel
theorem okM53 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 1 = true := okB462
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 2 = true := blkChk_join _ _ _ _ _ 462 1 1 h0 okB463
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 3 = true := blkChk_join _ _ _ _ _ 462 2 1 h1 okB464
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 4 = true := blkChk_join _ _ _ _ _ 462 3 1 h2 okB465
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 5 = true := blkChk_join _ _ _ _ _ 462 4 1 h3 okB466
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 6 = true := blkChk_join _ _ _ _ _ 462 5 1 h4 okB467
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 7 = true := blkChk_join _ _ _ _ _ 462 6 1 h5 okB468
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 8 = true := blkChk_join _ _ _ _ _ 462 7 1 h6 okB469
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 462 9 = true := blkChk_join _ _ _ _ _ 462 8 1 h7 okB470
  exact h8
end E1.C284X
