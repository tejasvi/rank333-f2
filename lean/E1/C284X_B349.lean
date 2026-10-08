module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3271 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3271 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3272 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3272 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3273 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3273 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3274 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3274 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3275 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3275 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG349 : glueChkR lits W 3271 5 = true := by
  rw [← glueChkRN_eq lits W 7747 3271 lenT]; decide +kernel
theorem okM349 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3271 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3271 1 = true := okB3271
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3271 2 = true := blkChk_join _ _ _ _ _ 3271 1 1 h0 okB3272
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3271 3 = true := blkChk_join _ _ _ _ _ 3271 2 1 h1 okB3273
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3271 4 = true := blkChk_join _ _ _ _ _ 3271 3 1 h2 okB3274
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3271 5 = true := blkChk_join _ _ _ _ _ 3271 4 1 h3 okB3275
  exact h4
end E1.C284X
