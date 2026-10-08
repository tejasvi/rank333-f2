module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2437 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2438 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2438 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2439 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2439 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2440 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2440 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2441 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2441 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2442 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2442 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2443 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2443 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2444 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2444 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2445 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2445 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2446 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2446 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG267 : glueChkR lits W 2437 10 = true := by
  rw [← glueChkRN_eq lits W 7747 2437 lenT]; decide +kernel
theorem okM267 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 1 = true := okB2437
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 2 = true := blkChk_join _ _ _ _ _ 2437 1 1 h0 okB2438
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 3 = true := blkChk_join _ _ _ _ _ 2437 2 1 h1 okB2439
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 4 = true := blkChk_join _ _ _ _ _ 2437 3 1 h2 okB2440
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 5 = true := blkChk_join _ _ _ _ _ 2437 4 1 h3 okB2441
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 6 = true := blkChk_join _ _ _ _ _ 2437 5 1 h4 okB2442
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 7 = true := blkChk_join _ _ _ _ _ 2437 6 1 h5 okB2443
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 8 = true := blkChk_join _ _ _ _ _ 2437 7 1 h6 okB2444
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 9 = true := blkChk_join _ _ _ _ _ 2437 8 1 h7 okB2445
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2437 10 = true := blkChk_join _ _ _ _ _ 2437 9 1 h8 okB2446
  exact h9
end E1.C284X
