module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1879 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1880 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1880 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1881 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1881 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1882 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1882 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1883 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1883 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1884 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1884 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1885 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1885 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1886 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1886 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1887 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1887 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1888 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1888 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1889 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1889 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG206 : glueChkR lits W 1879 11 = true := by
  rw [← glueChkRN_eq lits W 7747 1879 lenT]; decide +kernel
theorem okM206 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 1 = true := okB1879
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 2 = true := blkChk_join _ _ _ _ _ 1879 1 1 h0 okB1880
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 3 = true := blkChk_join _ _ _ _ _ 1879 2 1 h1 okB1881
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 4 = true := blkChk_join _ _ _ _ _ 1879 3 1 h2 okB1882
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 5 = true := blkChk_join _ _ _ _ _ 1879 4 1 h3 okB1883
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 6 = true := blkChk_join _ _ _ _ _ 1879 5 1 h4 okB1884
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 7 = true := blkChk_join _ _ _ _ _ 1879 6 1 h5 okB1885
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 8 = true := blkChk_join _ _ _ _ _ 1879 7 1 h6 okB1886
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 9 = true := blkChk_join _ _ _ _ _ 1879 8 1 h7 okB1887
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 10 = true := blkChk_join _ _ _ _ _ 1879 9 1 h8 okB1888
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1879 11 = true := blkChk_join _ _ _ _ _ 1879 10 1 h9 okB1889
  exact h10
end E1.C284X
