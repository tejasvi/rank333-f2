module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5714 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5714 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5715 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5715 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5716 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5716 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5717 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5717 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5718 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5718 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5719 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5719 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5720 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5720 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG603 : glueChkR lits W 5714 7 = true := by
  rw [← glueChkRN_eq lits W 7747 5714 lenT]; decide +kernel
theorem okM603 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5714 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5714 1 = true := okB5714
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5714 2 = true := blkChk_join _ _ _ _ _ 5714 1 1 h0 okB5715
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5714 3 = true := blkChk_join _ _ _ _ _ 5714 2 1 h1 okB5716
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5714 4 = true := blkChk_join _ _ _ _ _ 5714 3 1 h2 okB5717
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5714 5 = true := blkChk_join _ _ _ _ _ 5714 4 1 h3 okB5718
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5714 6 = true := blkChk_join _ _ _ _ _ 5714 5 1 h4 okB5719
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5714 7 = true := blkChk_join _ _ _ _ _ 5714 6 1 h5 okB5720
  exact h6
end E1.C284X
