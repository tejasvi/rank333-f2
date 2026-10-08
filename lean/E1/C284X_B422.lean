module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3997 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3997 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3998 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3998 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3999 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3999 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4000 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4000 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4001 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4001 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4002 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4002 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4003 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4003 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG422 : glueChkR lits W 3997 7 = true := by
  rw [← glueChkRN_eq lits W 7747 3997 lenT]; decide +kernel
theorem okM422 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3997 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3997 1 = true := okB3997
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3997 2 = true := blkChk_join _ _ _ _ _ 3997 1 1 h0 okB3998
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3997 3 = true := blkChk_join _ _ _ _ _ 3997 2 1 h1 okB3999
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3997 4 = true := blkChk_join _ _ _ _ _ 3997 3 1 h2 okB4000
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3997 5 = true := blkChk_join _ _ _ _ _ 3997 4 1 h3 okB4001
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3997 6 = true := blkChk_join _ _ _ _ _ 3997 5 1 h4 okB4002
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3997 7 = true := blkChk_join _ _ _ _ _ 3997 6 1 h5 okB4003
  exact h6
end E1.C284X
