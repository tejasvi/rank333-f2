module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1770 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1770 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1771 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1771 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1772 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1772 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1773 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1773 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1774 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1774 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1775 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1775 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1776 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1776 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1777 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1777 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG194 : glueChkR lits W 1770 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1770 lenT]; decide +kernel
theorem okM194 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1770 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1770 1 = true := okB1770
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1770 2 = true := blkChk_join _ _ _ _ _ 1770 1 1 h0 okB1771
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1770 3 = true := blkChk_join _ _ _ _ _ 1770 2 1 h1 okB1772
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1770 4 = true := blkChk_join _ _ _ _ _ 1770 3 1 h2 okB1773
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1770 5 = true := blkChk_join _ _ _ _ _ 1770 4 1 h3 okB1774
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1770 6 = true := blkChk_join _ _ _ _ _ 1770 5 1 h4 okB1775
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1770 7 = true := blkChk_join _ _ _ _ _ 1770 6 1 h5 okB1776
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1770 8 = true := blkChk_join _ _ _ _ _ 1770 7 1 h6 okB1777
  exact h7
end E1.C284X
