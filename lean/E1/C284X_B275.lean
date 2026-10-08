module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2533 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2533 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2534 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2534 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2535 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2535 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2536 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2536 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2537 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2537 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2538 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2538 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2539 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2539 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2540 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2540 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG275 : glueChkR lits W 2533 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2533 lenT]; decide +kernel
theorem okM275 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2533 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2533 1 = true := okB2533
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2533 2 = true := blkChk_join _ _ _ _ _ 2533 1 1 h0 okB2534
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2533 3 = true := blkChk_join _ _ _ _ _ 2533 2 1 h1 okB2535
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2533 4 = true := blkChk_join _ _ _ _ _ 2533 3 1 h2 okB2536
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2533 5 = true := blkChk_join _ _ _ _ _ 2533 4 1 h3 okB2537
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2533 6 = true := blkChk_join _ _ _ _ _ 2533 5 1 h4 okB2538
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2533 7 = true := blkChk_join _ _ _ _ _ 2533 6 1 h5 okB2539
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2533 8 = true := blkChk_join _ _ _ _ _ 2533 7 1 h6 okB2540
  exact h7
end E1.C284X
