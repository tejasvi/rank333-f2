module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3897 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3898 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3899 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3900 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3901 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3902 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3902 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG410 : glueChkR lits W 3897 6 = true := by
  rw [← glueChkRN_eq lits W 7747 3897 lenT]; decide +kernel
theorem okM410 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3897 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3897 1 = true := okB3897
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3897 2 = true := blkChk_join _ _ _ _ _ 3897 1 1 h0 okB3898
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3897 3 = true := blkChk_join _ _ _ _ _ 3897 2 1 h1 okB3899
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3897 4 = true := blkChk_join _ _ _ _ _ 3897 3 1 h2 okB3900
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3897 5 = true := blkChk_join _ _ _ _ _ 3897 4 1 h3 okB3901
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3897 6 = true := blkChk_join _ _ _ _ _ 3897 5 1 h4 okB3902
  exact h5
end E1.C284X
