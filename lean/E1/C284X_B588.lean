module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5554 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5555 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5555 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5556 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5556 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5557 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5557 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5558 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5558 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5559 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5559 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5560 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5560 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5561 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5561 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5562 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5562 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5563 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5563 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5564 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5564 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5565 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5565 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5566 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5566 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5567 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5567 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5568 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5568 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5569 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5569 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG588 : glueChkR lits W 5554 16 = true := by
  rw [← glueChkRN_eq lits W 7747 5554 lenT]; decide +kernel
theorem okM588 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 16 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 1 = true := okB5554
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 2 = true := blkChk_join _ _ _ _ _ 5554 1 1 h0 okB5555
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 3 = true := blkChk_join _ _ _ _ _ 5554 2 1 h1 okB5556
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 4 = true := blkChk_join _ _ _ _ _ 5554 3 1 h2 okB5557
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 5 = true := blkChk_join _ _ _ _ _ 5554 4 1 h3 okB5558
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 6 = true := blkChk_join _ _ _ _ _ 5554 5 1 h4 okB5559
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 7 = true := blkChk_join _ _ _ _ _ 5554 6 1 h5 okB5560
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 8 = true := blkChk_join _ _ _ _ _ 5554 7 1 h6 okB5561
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 9 = true := blkChk_join _ _ _ _ _ 5554 8 1 h7 okB5562
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 10 = true := blkChk_join _ _ _ _ _ 5554 9 1 h8 okB5563
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 11 = true := blkChk_join _ _ _ _ _ 5554 10 1 h9 okB5564
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 12 = true := blkChk_join _ _ _ _ _ 5554 11 1 h10 okB5565
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 13 = true := blkChk_join _ _ _ _ _ 5554 12 1 h11 okB5566
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 14 = true := blkChk_join _ _ _ _ _ 5554 13 1 h12 okB5567
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 15 = true := blkChk_join _ _ _ _ _ 5554 14 1 h13 okB5568
  have h15 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5554 16 = true := blkChk_join _ _ _ _ _ 5554 15 1 h14 okB5569
  exact h15
end E1.C284X
