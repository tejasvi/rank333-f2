module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3820 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3820 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3821 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3821 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3822 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3822 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3823 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3823 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3824 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3824 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3825 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3825 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3826 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3826 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG400 : glueChkR lits W 3820 7 = true := by
  rw [← glueChkRN_eq lits W 7747 3820 lenT]; decide +kernel
theorem okM400 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3820 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3820 1 = true := okB3820
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3820 2 = true := blkChk_join _ _ _ _ _ 3820 1 1 h0 okB3821
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3820 3 = true := blkChk_join _ _ _ _ _ 3820 2 1 h1 okB3822
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3820 4 = true := blkChk_join _ _ _ _ _ 3820 3 1 h2 okB3823
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3820 5 = true := blkChk_join _ _ _ _ _ 3820 4 1 h3 okB3824
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3820 6 = true := blkChk_join _ _ _ _ _ 3820 5 1 h4 okB3825
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3820 7 = true := blkChk_join _ _ _ _ _ 3820 6 1 h5 okB3826
  exact h6
end E1.C284X
