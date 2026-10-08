module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2384 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2384 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2385 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2385 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2386 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2386 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2387 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2387 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2388 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2388 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2389 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2389 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2390 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2390 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2391 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2391 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG234 : glueChkR lits W 2384 8 = true := by
  rw [← glueChkRN_eq lits W 8596 2384 lenT]; decide +kernel
theorem okM234 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2384 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2384 1 = true := okB2384
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2384 2 = true := blkChk_join _ _ _ _ _ 2384 1 1 h0 okB2385
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2384 3 = true := blkChk_join _ _ _ _ _ 2384 2 1 h1 okB2386
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2384 4 = true := blkChk_join _ _ _ _ _ 2384 3 1 h2 okB2387
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2384 5 = true := blkChk_join _ _ _ _ _ 2384 4 1 h3 okB2388
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2384 6 = true := blkChk_join _ _ _ _ _ 2384 5 1 h4 okB2389
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2384 7 = true := blkChk_join _ _ _ _ _ 2384 6 1 h5 okB2390
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2384 8 = true := blkChk_join _ _ _ _ _ 2384 7 1 h6 okB2391
  exact h7
end E1.C236X
