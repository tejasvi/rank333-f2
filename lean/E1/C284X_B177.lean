module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1642 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1643 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1643 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1644 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1644 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1645 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1645 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1646 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1646 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1647 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1647 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1648 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1648 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1649 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1649 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1650 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1650 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1651 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1651 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1652 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1652 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1653 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1653 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1654 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1654 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1655 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1655 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG177 : glueChkR lits W 1642 14 = true := by
  rw [← glueChkRN_eq lits W 7747 1642 lenT]; decide +kernel
theorem okM177 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 14 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 1 = true := okB1642
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 2 = true := blkChk_join _ _ _ _ _ 1642 1 1 h0 okB1643
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 3 = true := blkChk_join _ _ _ _ _ 1642 2 1 h1 okB1644
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 4 = true := blkChk_join _ _ _ _ _ 1642 3 1 h2 okB1645
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 5 = true := blkChk_join _ _ _ _ _ 1642 4 1 h3 okB1646
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 6 = true := blkChk_join _ _ _ _ _ 1642 5 1 h4 okB1647
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 7 = true := blkChk_join _ _ _ _ _ 1642 6 1 h5 okB1648
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 8 = true := blkChk_join _ _ _ _ _ 1642 7 1 h6 okB1649
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 9 = true := blkChk_join _ _ _ _ _ 1642 8 1 h7 okB1650
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 10 = true := blkChk_join _ _ _ _ _ 1642 9 1 h8 okB1651
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 11 = true := blkChk_join _ _ _ _ _ 1642 10 1 h9 okB1652
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 12 = true := blkChk_join _ _ _ _ _ 1642 11 1 h10 okB1653
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 13 = true := blkChk_join _ _ _ _ _ 1642 12 1 h11 okB1654
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1642 14 = true := blkChk_join _ _ _ _ _ 1642 13 1 h12 okB1655
  exact h13
end E1.C284X
