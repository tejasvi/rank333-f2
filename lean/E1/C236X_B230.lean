module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2348 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2348 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2349 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2349 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2350 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2350 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2351 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2351 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2352 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2352 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2353 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2353 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2354 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2354 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2355 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2355 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG230 : glueChkR lits W 2348 8 = true := by
  rw [← glueChkRN_eq lits W 8596 2348 lenT]; decide +kernel
theorem okM230 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2348 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2348 1 = true := okB2348
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2348 2 = true := blkChk_join _ _ _ _ _ 2348 1 1 h0 okB2349
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2348 3 = true := blkChk_join _ _ _ _ _ 2348 2 1 h1 okB2350
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2348 4 = true := blkChk_join _ _ _ _ _ 2348 3 1 h2 okB2351
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2348 5 = true := blkChk_join _ _ _ _ _ 2348 4 1 h3 okB2352
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2348 6 = true := blkChk_join _ _ _ _ _ 2348 5 1 h4 okB2353
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2348 7 = true := blkChk_join _ _ _ _ _ 2348 6 1 h5 okB2354
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2348 8 = true := blkChk_join _ _ _ _ _ 2348 7 1 h6 okB2355
  exact h7
end E1.C236X
