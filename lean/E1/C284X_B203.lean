module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1852 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1853 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1853 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1854 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1854 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1855 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1855 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1856 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1856 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1857 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1857 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1858 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1858 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1859 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1859 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1860 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1860 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1861 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1861 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1862 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1862 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG203 : glueChkR lits W 1852 11 = true := by
  rw [← glueChkRN_eq lits W 7747 1852 lenT]; decide +kernel
theorem okM203 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 1 = true := okB1852
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 2 = true := blkChk_join _ _ _ _ _ 1852 1 1 h0 okB1853
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 3 = true := blkChk_join _ _ _ _ _ 1852 2 1 h1 okB1854
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 4 = true := blkChk_join _ _ _ _ _ 1852 3 1 h2 okB1855
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 5 = true := blkChk_join _ _ _ _ _ 1852 4 1 h3 okB1856
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 6 = true := blkChk_join _ _ _ _ _ 1852 5 1 h4 okB1857
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 7 = true := blkChk_join _ _ _ _ _ 1852 6 1 h5 okB1858
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 8 = true := blkChk_join _ _ _ _ _ 1852 7 1 h6 okB1859
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 9 = true := blkChk_join _ _ _ _ _ 1852 8 1 h7 okB1860
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 10 = true := blkChk_join _ _ _ _ _ 1852 9 1 h8 okB1861
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1852 11 = true := blkChk_join _ _ _ _ _ 1852 10 1 h9 okB1862
  exact h10
end E1.C284X
