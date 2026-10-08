module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1909 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1909 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1910 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1910 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1911 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1911 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1912 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1912 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1913 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1913 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1914 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1914 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1915 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1915 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG185 : glueChkR lits W 1909 7 = true := by
  rw [← glueChkRN_eq lits W 8596 1909 lenT]; decide +kernel
theorem okM185 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1909 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1909 1 = true := okB1909
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1909 2 = true := blkChk_join _ _ _ _ _ 1909 1 1 h0 okB1910
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1909 3 = true := blkChk_join _ _ _ _ _ 1909 2 1 h1 okB1911
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1909 4 = true := blkChk_join _ _ _ _ _ 1909 3 1 h2 okB1912
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1909 5 = true := blkChk_join _ _ _ _ _ 1909 4 1 h3 okB1913
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1909 6 = true := blkChk_join _ _ _ _ _ 1909 5 1 h4 okB1914
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1909 7 = true := blkChk_join _ _ _ _ _ 1909 6 1 h5 okB1915
  exact h6
end E1.C236X
