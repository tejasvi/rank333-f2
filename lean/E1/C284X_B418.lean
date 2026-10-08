module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3967 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3967 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3968 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3968 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3969 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3969 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3970 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3970 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3971 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3971 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3972 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3972 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG418 : glueChkR lits W 3967 6 = true := by
  rw [← glueChkRN_eq lits W 7747 3967 lenT]; decide +kernel
theorem okM418 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3967 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3967 1 = true := okB3967
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3967 2 = true := blkChk_join _ _ _ _ _ 3967 1 1 h0 okB3968
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3967 3 = true := blkChk_join _ _ _ _ _ 3967 2 1 h1 okB3969
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3967 4 = true := blkChk_join _ _ _ _ _ 3967 3 1 h2 okB3970
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3967 5 = true := blkChk_join _ _ _ _ _ 3967 4 1 h3 okB3971
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3967 6 = true := blkChk_join _ _ _ _ _ 3967 5 1 h4 okB3972
  exact h5
end E1.C284X
