module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4954 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4955 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4955 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4956 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4956 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4957 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4957 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4958 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4958 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4959 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4959 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4960 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4960 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4961 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4961 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4962 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4962 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4963 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4963 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG485 : glueChkR lits W 4954 10 = true := by
  rw [← glueChkRN_eq lits W 8596 4954 lenT]; decide +kernel
theorem okM485 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 1 = true := okB4954
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 2 = true := blkChk_join _ _ _ _ _ 4954 1 1 h0 okB4955
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 3 = true := blkChk_join _ _ _ _ _ 4954 2 1 h1 okB4956
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 4 = true := blkChk_join _ _ _ _ _ 4954 3 1 h2 okB4957
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 5 = true := blkChk_join _ _ _ _ _ 4954 4 1 h3 okB4958
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 6 = true := blkChk_join _ _ _ _ _ 4954 5 1 h4 okB4959
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 7 = true := blkChk_join _ _ _ _ _ 4954 6 1 h5 okB4960
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 8 = true := blkChk_join _ _ _ _ _ 4954 7 1 h6 okB4961
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 9 = true := blkChk_join _ _ _ _ _ 4954 8 1 h7 okB4962
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4954 10 = true := blkChk_join _ _ _ _ _ 4954 9 1 h8 okB4963
  exact h9
end E1.C236X
