module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB955 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 955 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB956 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 956 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB957 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 957 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB958 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 958 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB959 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 959 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB960 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 960 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB961 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 961 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB962 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 962 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG90 : glueChkR lits W 955 8 = true := by
  rw [← glueChkRN_eq lits W 8596 955 lenT]; decide +kernel
theorem okM90 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 955 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 955 1 = true := okB955
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 955 2 = true := blkChk_join _ _ _ _ _ 955 1 1 h0 okB956
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 955 3 = true := blkChk_join _ _ _ _ _ 955 2 1 h1 okB957
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 955 4 = true := blkChk_join _ _ _ _ _ 955 3 1 h2 okB958
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 955 5 = true := blkChk_join _ _ _ _ _ 955 4 1 h3 okB959
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 955 6 = true := blkChk_join _ _ _ _ _ 955 5 1 h4 okB960
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 955 7 = true := blkChk_join _ _ _ _ _ 955 6 1 h5 okB961
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 955 8 = true := blkChk_join _ _ _ _ _ 955 7 1 h6 okB962
  exact h7
end E1.C236X
