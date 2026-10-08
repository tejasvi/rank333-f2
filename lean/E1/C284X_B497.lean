module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4708 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4708 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4709 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4709 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4710 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4710 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4711 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4711 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4712 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4712 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4713 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4713 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4714 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4714 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4715 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4715 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG497 : glueChkR lits W 4708 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4708 lenT]; decide +kernel
theorem okM497 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4708 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4708 1 = true := okB4708
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4708 2 = true := blkChk_join _ _ _ _ _ 4708 1 1 h0 okB4709
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4708 3 = true := blkChk_join _ _ _ _ _ 4708 2 1 h1 okB4710
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4708 4 = true := blkChk_join _ _ _ _ _ 4708 3 1 h2 okB4711
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4708 5 = true := blkChk_join _ _ _ _ _ 4708 4 1 h3 okB4712
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4708 6 = true := blkChk_join _ _ _ _ _ 4708 5 1 h4 okB4713
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4708 7 = true := blkChk_join _ _ _ _ _ 4708 6 1 h5 okB4714
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4708 8 = true := blkChk_join _ _ _ _ _ 4708 7 1 h6 okB4715
  exact h7
end E1.C284X
