module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7671 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7672 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7672 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7673 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7673 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7674 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7674 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7675 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7675 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7676 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7676 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7677 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7677 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7678 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7678 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7679 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7679 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7680 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7680 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7681 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7681 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7682 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7682 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7683 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7683 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7684 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7684 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7685 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7685 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7686 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7686 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG770 : glueChkR lits W 7671 16 = true := by
  rw [← glueChkRN_eq lits W 7747 7671 lenT]; decide +kernel
theorem okM770 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 16 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 1 = true := okB7671
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 2 = true := blkChk_join _ _ _ _ _ 7671 1 1 h0 okB7672
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 3 = true := blkChk_join _ _ _ _ _ 7671 2 1 h1 okB7673
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 4 = true := blkChk_join _ _ _ _ _ 7671 3 1 h2 okB7674
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 5 = true := blkChk_join _ _ _ _ _ 7671 4 1 h3 okB7675
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 6 = true := blkChk_join _ _ _ _ _ 7671 5 1 h4 okB7676
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 7 = true := blkChk_join _ _ _ _ _ 7671 6 1 h5 okB7677
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 8 = true := blkChk_join _ _ _ _ _ 7671 7 1 h6 okB7678
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 9 = true := blkChk_join _ _ _ _ _ 7671 8 1 h7 okB7679
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 10 = true := blkChk_join _ _ _ _ _ 7671 9 1 h8 okB7680
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 11 = true := blkChk_join _ _ _ _ _ 7671 10 1 h9 okB7681
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 12 = true := blkChk_join _ _ _ _ _ 7671 11 1 h10 okB7682
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 13 = true := blkChk_join _ _ _ _ _ 7671 12 1 h11 okB7683
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 14 = true := blkChk_join _ _ _ _ _ 7671 13 1 h12 okB7684
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 15 = true := blkChk_join _ _ _ _ _ 7671 14 1 h13 okB7685
  have h15 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7671 16 = true := blkChk_join _ _ _ _ _ 7671 15 1 h14 okB7686
  exact h15
end E1.C284X
