module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1908 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1908 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1909 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1909 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1910 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1910 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1911 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1911 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1912 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1912 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1913 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1913 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG209 : glueChkR lits W 1908 6 = true := by
  rw [← glueChkRN_eq lits W 7747 1908 lenT]; decide +kernel
theorem okM209 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1908 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1908 1 = true := okB1908
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1908 2 = true := blkChk_join _ _ _ _ _ 1908 1 1 h0 okB1909
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1908 3 = true := blkChk_join _ _ _ _ _ 1908 2 1 h1 okB1910
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1908 4 = true := blkChk_join _ _ _ _ _ 1908 3 1 h2 okB1911
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1908 5 = true := blkChk_join _ _ _ _ _ 1908 4 1 h3 okB1912
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1908 6 = true := blkChk_join _ _ _ _ _ 1908 5 1 h4 okB1913
  exact h5
end E1.C284X
