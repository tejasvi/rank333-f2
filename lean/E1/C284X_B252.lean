module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2294 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2294 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2295 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2295 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2296 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2296 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2297 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2297 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2298 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2298 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2299 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2299 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2300 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2300 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2301 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2301 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG252 : glueChkR lits W 2294 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2294 lenT]; decide +kernel
theorem okM252 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2294 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2294 1 = true := okB2294
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2294 2 = true := blkChk_join _ _ _ _ _ 2294 1 1 h0 okB2295
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2294 3 = true := blkChk_join _ _ _ _ _ 2294 2 1 h1 okB2296
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2294 4 = true := blkChk_join _ _ _ _ _ 2294 3 1 h2 okB2297
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2294 5 = true := blkChk_join _ _ _ _ _ 2294 4 1 h3 okB2298
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2294 6 = true := blkChk_join _ _ _ _ _ 2294 5 1 h4 okB2299
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2294 7 = true := blkChk_join _ _ _ _ _ 2294 6 1 h5 okB2300
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2294 8 = true := blkChk_join _ _ _ _ _ 2294 7 1 h6 okB2301
  exact h7
end E1.C284X
