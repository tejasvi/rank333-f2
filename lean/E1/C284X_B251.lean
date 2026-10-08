module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2285 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2286 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2286 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2287 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2287 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2288 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2288 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2289 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2289 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2290 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2290 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2291 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2291 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2292 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2292 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2293 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2293 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG251 : glueChkR lits W 2285 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2285 lenT]; decide +kernel
theorem okM251 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 1 = true := okB2285
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 2 = true := blkChk_join _ _ _ _ _ 2285 1 1 h0 okB2286
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 3 = true := blkChk_join _ _ _ _ _ 2285 2 1 h1 okB2287
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 4 = true := blkChk_join _ _ _ _ _ 2285 3 1 h2 okB2288
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 5 = true := blkChk_join _ _ _ _ _ 2285 4 1 h3 okB2289
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 6 = true := blkChk_join _ _ _ _ _ 2285 5 1 h4 okB2290
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 7 = true := blkChk_join _ _ _ _ _ 2285 6 1 h5 okB2291
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 8 = true := blkChk_join _ _ _ _ _ 2285 7 1 h6 okB2292
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2285 9 = true := blkChk_join _ _ _ _ _ 2285 8 1 h7 okB2293
  exact h8
end E1.C284X
