module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5544 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5545 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5545 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5546 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5546 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5547 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5547 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5548 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5548 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5549 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5549 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5550 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5550 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5551 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5551 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5552 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5552 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5553 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5553 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG587 : glueChkR lits W 5544 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5544 lenT]; decide +kernel
theorem okM587 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 1 = true := okB5544
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 2 = true := blkChk_join _ _ _ _ _ 5544 1 1 h0 okB5545
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 3 = true := blkChk_join _ _ _ _ _ 5544 2 1 h1 okB5546
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 4 = true := blkChk_join _ _ _ _ _ 5544 3 1 h2 okB5547
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 5 = true := blkChk_join _ _ _ _ _ 5544 4 1 h3 okB5548
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 6 = true := blkChk_join _ _ _ _ _ 5544 5 1 h4 okB5549
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 7 = true := blkChk_join _ _ _ _ _ 5544 6 1 h5 okB5550
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 8 = true := blkChk_join _ _ _ _ _ 5544 7 1 h6 okB5551
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 9 = true := blkChk_join _ _ _ _ _ 5544 8 1 h7 okB5552
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5544 10 = true := blkChk_join _ _ _ _ _ 5544 9 1 h8 okB5553
  exact h9
end E1.C284X
