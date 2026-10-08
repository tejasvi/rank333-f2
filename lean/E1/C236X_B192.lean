module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1966 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1967 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1967 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1968 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1968 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1969 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1969 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1970 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1970 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1971 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1971 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1972 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1972 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1973 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1973 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1974 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1974 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1975 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1975 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1976 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG192 : glueChkR lits W 1966 11 = true := by
  rw [← glueChkRN_eq lits W 8596 1966 lenT]; decide +kernel
theorem okM192 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 11 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 1 = true := okB1966
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 2 = true := blkChk_join _ _ _ _ _ 1966 1 1 h0 okB1967
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 3 = true := blkChk_join _ _ _ _ _ 1966 2 1 h1 okB1968
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 4 = true := blkChk_join _ _ _ _ _ 1966 3 1 h2 okB1969
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 5 = true := blkChk_join _ _ _ _ _ 1966 4 1 h3 okB1970
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 6 = true := blkChk_join _ _ _ _ _ 1966 5 1 h4 okB1971
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 7 = true := blkChk_join _ _ _ _ _ 1966 6 1 h5 okB1972
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 8 = true := blkChk_join _ _ _ _ _ 1966 7 1 h6 okB1973
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 9 = true := blkChk_join _ _ _ _ _ 1966 8 1 h7 okB1974
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 10 = true := blkChk_join _ _ _ _ _ 1966 9 1 h8 okB1975
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1966 11 = true := blkChk_join _ _ _ _ _ 1966 10 1 h9 okB1976
  exact h10
end E1.C236X
