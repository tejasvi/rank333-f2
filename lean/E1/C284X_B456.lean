module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4286 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4287 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4287 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4288 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4288 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4289 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4289 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4290 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4290 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4291 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4291 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4292 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4292 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4293 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4293 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4294 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4294 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG456 : glueChkR lits W 4286 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4286 lenT]; decide +kernel
theorem okM456 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 1 = true := okB4286
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 2 = true := blkChk_join _ _ _ _ _ 4286 1 1 h0 okB4287
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 3 = true := blkChk_join _ _ _ _ _ 4286 2 1 h1 okB4288
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 4 = true := blkChk_join _ _ _ _ _ 4286 3 1 h2 okB4289
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 5 = true := blkChk_join _ _ _ _ _ 4286 4 1 h3 okB4290
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 6 = true := blkChk_join _ _ _ _ _ 4286 5 1 h4 okB4291
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 7 = true := blkChk_join _ _ _ _ _ 4286 6 1 h5 okB4292
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 8 = true := blkChk_join _ _ _ _ _ 4286 7 1 h6 okB4293
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4286 9 = true := blkChk_join _ _ _ _ _ 4286 8 1 h7 okB4294
  exact h8
end E1.C284X
