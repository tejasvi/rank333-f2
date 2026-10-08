module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2314 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2315 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2315 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2316 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2316 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2317 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2317 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2318 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2318 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2319 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2319 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2320 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2320 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2321 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2321 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2322 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2322 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG254 : glueChkR lits W 2314 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2314 lenT]; decide +kernel
theorem okM254 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 1 = true := okB2314
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 2 = true := blkChk_join _ _ _ _ _ 2314 1 1 h0 okB2315
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 3 = true := blkChk_join _ _ _ _ _ 2314 2 1 h1 okB2316
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 4 = true := blkChk_join _ _ _ _ _ 2314 3 1 h2 okB2317
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 5 = true := blkChk_join _ _ _ _ _ 2314 4 1 h3 okB2318
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 6 = true := blkChk_join _ _ _ _ _ 2314 5 1 h4 okB2319
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 7 = true := blkChk_join _ _ _ _ _ 2314 6 1 h5 okB2320
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 8 = true := blkChk_join _ _ _ _ _ 2314 7 1 h6 okB2321
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2314 9 = true := blkChk_join _ _ _ _ _ 2314 8 1 h7 okB2322
  exact h8
end E1.C284X
