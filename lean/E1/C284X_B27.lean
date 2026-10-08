module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB279 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 279 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB280 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 280 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB281 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 281 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB282 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 282 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB283 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 283 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB284 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 284 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB285 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 285 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB286 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 286 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG27 : glueChkR lits W 279 8 = true := by
  rw [← glueChkRN_eq lits W 7747 279 lenT]; decide +kernel
theorem okM27 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 279 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 279 1 = true := okB279
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 279 2 = true := blkChk_join _ _ _ _ _ 279 1 1 h0 okB280
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 279 3 = true := blkChk_join _ _ _ _ _ 279 2 1 h1 okB281
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 279 4 = true := blkChk_join _ _ _ _ _ 279 3 1 h2 okB282
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 279 5 = true := blkChk_join _ _ _ _ _ 279 4 1 h3 okB283
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 279 6 = true := blkChk_join _ _ _ _ _ 279 5 1 h4 okB284
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 279 7 = true := blkChk_join _ _ _ _ _ 279 6 1 h5 okB285
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 279 8 = true := blkChk_join _ _ _ _ _ 279 7 1 h6 okB286
  exact h7
end E1.C284X
