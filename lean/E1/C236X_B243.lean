module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2480 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2481 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2481 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2482 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2482 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2483 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2483 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2484 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2484 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2485 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2485 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2486 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2486 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2487 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2487 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2488 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2488 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2489 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2489 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG243 : glueChkR lits W 2480 10 = true := by
  rw [← glueChkRN_eq lits W 8596 2480 lenT]; decide +kernel
theorem okM243 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 1 = true := okB2480
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 2 = true := blkChk_join _ _ _ _ _ 2480 1 1 h0 okB2481
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 3 = true := blkChk_join _ _ _ _ _ 2480 2 1 h1 okB2482
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 4 = true := blkChk_join _ _ _ _ _ 2480 3 1 h2 okB2483
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 5 = true := blkChk_join _ _ _ _ _ 2480 4 1 h3 okB2484
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 6 = true := blkChk_join _ _ _ _ _ 2480 5 1 h4 okB2485
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 7 = true := blkChk_join _ _ _ _ _ 2480 6 1 h5 okB2486
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 8 = true := blkChk_join _ _ _ _ _ 2480 7 1 h6 okB2487
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 9 = true := blkChk_join _ _ _ _ _ 2480 8 1 h7 okB2488
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2480 10 = true := blkChk_join _ _ _ _ _ 2480 9 1 h8 okB2489
  exact h9
end E1.C236X
