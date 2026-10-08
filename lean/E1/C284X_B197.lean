module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1792 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1792 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1793 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1793 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1794 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1794 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1795 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1795 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1796 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1796 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1797 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1797 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1798 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1798 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG197 : glueChkR lits W 1792 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1792 lenT]; decide +kernel
theorem okM197 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1792 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1792 1 = true := okB1792
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1792 2 = true := blkChk_join _ _ _ _ _ 1792 1 1 h0 okB1793
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1792 3 = true := blkChk_join _ _ _ _ _ 1792 2 1 h1 okB1794
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1792 4 = true := blkChk_join _ _ _ _ _ 1792 3 1 h2 okB1795
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1792 5 = true := blkChk_join _ _ _ _ _ 1792 4 1 h3 okB1796
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1792 6 = true := blkChk_join _ _ _ _ _ 1792 5 1 h4 okB1797
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1792 7 = true := blkChk_join _ _ _ _ _ 1792 6 1 h5 okB1798
  exact h6
end E1.C284X
