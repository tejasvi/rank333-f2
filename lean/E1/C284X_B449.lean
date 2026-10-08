module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4217 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4217 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4218 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4218 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4219 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4219 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4220 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4220 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4221 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4221 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4222 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4222 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4223 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4223 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4224 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4224 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG449 : glueChkR lits W 4217 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4217 lenT]; decide +kernel
theorem okM449 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4217 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4217 1 = true := okB4217
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4217 2 = true := blkChk_join _ _ _ _ _ 4217 1 1 h0 okB4218
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4217 3 = true := blkChk_join _ _ _ _ _ 4217 2 1 h1 okB4219
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4217 4 = true := blkChk_join _ _ _ _ _ 4217 3 1 h2 okB4220
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4217 5 = true := blkChk_join _ _ _ _ _ 4217 4 1 h3 okB4221
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4217 6 = true := blkChk_join _ _ _ _ _ 4217 5 1 h4 okB4222
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4217 7 = true := blkChk_join _ _ _ _ _ 4217 6 1 h5 okB4223
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4217 8 = true := blkChk_join _ _ _ _ _ 4217 7 1 h6 okB4224
  exact h7
end E1.C284X
