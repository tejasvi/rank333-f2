module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1954 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1954 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1955 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1955 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1956 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1956 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1957 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1957 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1958 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1958 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1959 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1959 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1960 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1960 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1961 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1961 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG215 : glueChkR lits W 1954 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1954 lenT]; decide +kernel
theorem okM215 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1954 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1954 1 = true := okB1954
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1954 2 = true := blkChk_join _ _ _ _ _ 1954 1 1 h0 okB1955
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1954 3 = true := blkChk_join _ _ _ _ _ 1954 2 1 h1 okB1956
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1954 4 = true := blkChk_join _ _ _ _ _ 1954 3 1 h2 okB1957
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1954 5 = true := blkChk_join _ _ _ _ _ 1954 4 1 h3 okB1958
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1954 6 = true := blkChk_join _ _ _ _ _ 1954 5 1 h4 okB1959
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1954 7 = true := blkChk_join _ _ _ _ _ 1954 6 1 h5 okB1960
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1954 8 = true := blkChk_join _ _ _ _ _ 1954 7 1 h6 okB1961
  exact h7
end E1.C284X
