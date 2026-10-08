module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1785 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1785 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1786 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1786 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1787 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1787 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1788 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1788 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1789 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1789 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1790 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1790 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1791 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1791 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG196 : glueChkR lits W 1785 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1785 lenT]; decide +kernel
theorem okM196 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1785 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1785 1 = true := okB1785
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1785 2 = true := blkChk_join _ _ _ _ _ 1785 1 1 h0 okB1786
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1785 3 = true := blkChk_join _ _ _ _ _ 1785 2 1 h1 okB1787
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1785 4 = true := blkChk_join _ _ _ _ _ 1785 3 1 h2 okB1788
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1785 5 = true := blkChk_join _ _ _ _ _ 1785 4 1 h3 okB1789
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1785 6 = true := blkChk_join _ _ _ _ _ 1785 5 1 h4 okB1790
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1785 7 = true := blkChk_join _ _ _ _ _ 1785 6 1 h5 okB1791
  exact h6
end E1.C284X
