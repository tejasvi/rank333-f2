module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2460 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2461 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2461 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2462 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2462 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2463 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2463 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2464 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2464 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2465 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2465 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2466 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2466 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2467 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2467 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2468 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2468 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2469 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2469 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2470 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2470 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG269 : glueChkR lits W 2460 11 = true := by
  rw [← glueChkRN_eq lits W 7747 2460 lenT]; decide +kernel
theorem okM269 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 1 = true := okB2460
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 2 = true := blkChk_join _ _ _ _ _ 2460 1 1 h0 okB2461
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 3 = true := blkChk_join _ _ _ _ _ 2460 2 1 h1 okB2462
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 4 = true := blkChk_join _ _ _ _ _ 2460 3 1 h2 okB2463
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 5 = true := blkChk_join _ _ _ _ _ 2460 4 1 h3 okB2464
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 6 = true := blkChk_join _ _ _ _ _ 2460 5 1 h4 okB2465
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 7 = true := blkChk_join _ _ _ _ _ 2460 6 1 h5 okB2466
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 8 = true := blkChk_join _ _ _ _ _ 2460 7 1 h6 okB2467
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 9 = true := blkChk_join _ _ _ _ _ 2460 8 1 h7 okB2468
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 10 = true := blkChk_join _ _ _ _ _ 2460 9 1 h8 okB2469
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2460 11 = true := blkChk_join _ _ _ _ _ 2460 10 1 h9 okB2470
  exact h10
end E1.C284X
