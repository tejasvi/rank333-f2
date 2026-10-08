module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB907 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB908 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 908 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB909 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 909 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB910 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 910 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB911 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 911 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB912 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 912 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB913 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 913 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB914 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 914 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB915 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 915 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB916 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 916 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG85 : glueChkR lits W 907 10 = true := by
  rw [← glueChkRN_eq lits W 8596 907 lenT]; decide +kernel
theorem okM85 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 1 = true := okB907
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 2 = true := blkChk_join _ _ _ _ _ 907 1 1 h0 okB908
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 3 = true := blkChk_join _ _ _ _ _ 907 2 1 h1 okB909
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 4 = true := blkChk_join _ _ _ _ _ 907 3 1 h2 okB910
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 5 = true := blkChk_join _ _ _ _ _ 907 4 1 h3 okB911
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 6 = true := blkChk_join _ _ _ _ _ 907 5 1 h4 okB912
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 7 = true := blkChk_join _ _ _ _ _ 907 6 1 h5 okB913
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 8 = true := blkChk_join _ _ _ _ _ 907 7 1 h6 okB914
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 9 = true := blkChk_join _ _ _ _ _ 907 8 1 h7 okB915
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 907 10 = true := blkChk_join _ _ _ _ _ 907 9 1 h8 okB916
  exact h9
end E1.C236X
