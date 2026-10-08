module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2302 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2303 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2303 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2304 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2304 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2305 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2305 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2306 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2306 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2307 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2307 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2308 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2308 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2309 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2309 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2310 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2310 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2311 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2311 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2312 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2312 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2313 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2313 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG253 : glueChkR lits W 2302 12 = true := by
  rw [← glueChkRN_eq lits W 7747 2302 lenT]; decide +kernel
theorem okM253 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 1 = true := okB2302
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 2 = true := blkChk_join _ _ _ _ _ 2302 1 1 h0 okB2303
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 3 = true := blkChk_join _ _ _ _ _ 2302 2 1 h1 okB2304
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 4 = true := blkChk_join _ _ _ _ _ 2302 3 1 h2 okB2305
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 5 = true := blkChk_join _ _ _ _ _ 2302 4 1 h3 okB2306
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 6 = true := blkChk_join _ _ _ _ _ 2302 5 1 h4 okB2307
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 7 = true := blkChk_join _ _ _ _ _ 2302 6 1 h5 okB2308
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 8 = true := blkChk_join _ _ _ _ _ 2302 7 1 h6 okB2309
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 9 = true := blkChk_join _ _ _ _ _ 2302 8 1 h7 okB2310
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 10 = true := blkChk_join _ _ _ _ _ 2302 9 1 h8 okB2311
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 11 = true := blkChk_join _ _ _ _ _ 2302 10 1 h9 okB2312
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2302 12 = true := blkChk_join _ _ _ _ _ 2302 11 1 h10 okB2313
  exact h11
end E1.C284X
