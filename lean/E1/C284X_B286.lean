module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2640 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2641 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2641 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2642 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2642 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2643 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2643 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2644 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2644 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2645 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2645 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2646 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2646 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2647 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2647 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2648 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2648 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2649 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2649 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2650 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2650 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG286 : glueChkR lits W 2640 11 = true := by
  rw [← glueChkRN_eq lits W 7747 2640 lenT]; decide +kernel
theorem okM286 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 1 = true := okB2640
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 2 = true := blkChk_join _ _ _ _ _ 2640 1 1 h0 okB2641
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 3 = true := blkChk_join _ _ _ _ _ 2640 2 1 h1 okB2642
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 4 = true := blkChk_join _ _ _ _ _ 2640 3 1 h2 okB2643
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 5 = true := blkChk_join _ _ _ _ _ 2640 4 1 h3 okB2644
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 6 = true := blkChk_join _ _ _ _ _ 2640 5 1 h4 okB2645
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 7 = true := blkChk_join _ _ _ _ _ 2640 6 1 h5 okB2646
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 8 = true := blkChk_join _ _ _ _ _ 2640 7 1 h6 okB2647
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 9 = true := blkChk_join _ _ _ _ _ 2640 8 1 h7 okB2648
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 10 = true := blkChk_join _ _ _ _ _ 2640 9 1 h8 okB2649
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2640 11 = true := blkChk_join _ _ _ _ _ 2640 10 1 h9 okB2650
  exact h10
end E1.C284X
