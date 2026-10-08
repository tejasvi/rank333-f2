module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3850 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3850 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3851 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3851 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3852 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3852 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3853 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3853 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3854 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3854 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG404 : glueChkR lits W 3850 5 = true := by
  rw [← glueChkRN_eq lits W 7747 3850 lenT]; decide +kernel
theorem okM404 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3850 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3850 1 = true := okB3850
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3850 2 = true := blkChk_join _ _ _ _ _ 3850 1 1 h0 okB3851
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3850 3 = true := blkChk_join _ _ _ _ _ 3850 2 1 h1 okB3852
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3850 4 = true := blkChk_join _ _ _ _ _ 3850 3 1 h2 okB3853
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3850 5 = true := blkChk_join _ _ _ _ _ 3850 4 1 h3 okB3854
  exact h4
end E1.C284X
