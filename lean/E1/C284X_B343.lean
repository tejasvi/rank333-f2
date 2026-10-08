module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3212 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3213 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3213 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3214 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3214 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3215 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3215 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3216 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3216 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3217 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3217 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3218 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3218 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3219 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3219 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3220 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3220 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG343 : glueChkR lits W 3212 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3212 lenT]; decide +kernel
theorem okM343 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 1 = true := okB3212
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 2 = true := blkChk_join _ _ _ _ _ 3212 1 1 h0 okB3213
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 3 = true := blkChk_join _ _ _ _ _ 3212 2 1 h1 okB3214
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 4 = true := blkChk_join _ _ _ _ _ 3212 3 1 h2 okB3215
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 5 = true := blkChk_join _ _ _ _ _ 3212 4 1 h3 okB3216
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 6 = true := blkChk_join _ _ _ _ _ 3212 5 1 h4 okB3217
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 7 = true := blkChk_join _ _ _ _ _ 3212 6 1 h5 okB3218
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 8 = true := blkChk_join _ _ _ _ _ 3212 7 1 h6 okB3219
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3212 9 = true := blkChk_join _ _ _ _ _ 3212 8 1 h7 okB3220
  exact h8
end E1.C284X
