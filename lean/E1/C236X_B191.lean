module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1959 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1959 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1960 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1960 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1961 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1961 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1962 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1962 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1963 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1963 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1964 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1964 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1965 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1965 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG191 : glueChkR lits W 1959 7 = true := by
  rw [← glueChkRN_eq lits W 8596 1959 lenT]; decide +kernel
theorem okM191 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1959 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1959 1 = true := okB1959
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1959 2 = true := blkChk_join _ _ _ _ _ 1959 1 1 h0 okB1960
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1959 3 = true := blkChk_join _ _ _ _ _ 1959 2 1 h1 okB1961
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1959 4 = true := blkChk_join _ _ _ _ _ 1959 3 1 h2 okB1962
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1959 5 = true := blkChk_join _ _ _ _ _ 1959 4 1 h3 okB1963
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1959 6 = true := blkChk_join _ _ _ _ _ 1959 5 1 h4 okB1964
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1959 7 = true := blkChk_join _ _ _ _ _ 1959 6 1 h5 okB1965
  exact h6
end E1.C236X
