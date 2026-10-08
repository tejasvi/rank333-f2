module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2471 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2472 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2472 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2473 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2473 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2474 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2474 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2475 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2475 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2476 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2476 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2477 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2477 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2478 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2478 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2479 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2479 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2480 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2480 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG270 : glueChkR lits W 2471 10 = true := by
  rw [← glueChkRN_eq lits W 7747 2471 lenT]; decide +kernel
theorem okM270 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 1 = true := okB2471
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 2 = true := blkChk_join _ _ _ _ _ 2471 1 1 h0 okB2472
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 3 = true := blkChk_join _ _ _ _ _ 2471 2 1 h1 okB2473
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 4 = true := blkChk_join _ _ _ _ _ 2471 3 1 h2 okB2474
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 5 = true := blkChk_join _ _ _ _ _ 2471 4 1 h3 okB2475
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 6 = true := blkChk_join _ _ _ _ _ 2471 5 1 h4 okB2476
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 7 = true := blkChk_join _ _ _ _ _ 2471 6 1 h5 okB2477
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 8 = true := blkChk_join _ _ _ _ _ 2471 7 1 h6 okB2478
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 9 = true := blkChk_join _ _ _ _ _ 2471 8 1 h7 okB2479
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2471 10 = true := blkChk_join _ _ _ _ _ 2471 9 1 h8 okB2480
  exact h9
end E1.C284X
