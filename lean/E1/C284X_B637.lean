module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6069 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6070 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6071 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6072 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6073 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6074 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6075 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6076 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6077 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6077 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6078 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6078 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6079 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6079 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6080 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6080 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6081 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6081 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6082 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6082 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6083 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6083 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6084 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6084 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG637 : glueChkR lits W 6069 16 = true := by
  rw [← glueChkRN_eq lits W 7747 6069 lenT]; decide +kernel
theorem okM637 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 16 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 1 = true := okB6069
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 2 = true := blkChk_join _ _ _ _ _ 6069 1 1 h0 okB6070
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 3 = true := blkChk_join _ _ _ _ _ 6069 2 1 h1 okB6071
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 4 = true := blkChk_join _ _ _ _ _ 6069 3 1 h2 okB6072
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 5 = true := blkChk_join _ _ _ _ _ 6069 4 1 h3 okB6073
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 6 = true := blkChk_join _ _ _ _ _ 6069 5 1 h4 okB6074
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 7 = true := blkChk_join _ _ _ _ _ 6069 6 1 h5 okB6075
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 8 = true := blkChk_join _ _ _ _ _ 6069 7 1 h6 okB6076
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 9 = true := blkChk_join _ _ _ _ _ 6069 8 1 h7 okB6077
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 10 = true := blkChk_join _ _ _ _ _ 6069 9 1 h8 okB6078
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 11 = true := blkChk_join _ _ _ _ _ 6069 10 1 h9 okB6079
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 12 = true := blkChk_join _ _ _ _ _ 6069 11 1 h10 okB6080
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 13 = true := blkChk_join _ _ _ _ _ 6069 12 1 h11 okB6081
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 14 = true := blkChk_join _ _ _ _ _ 6069 13 1 h12 okB6082
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 15 = true := blkChk_join _ _ _ _ _ 6069 14 1 h13 okB6083
  have h15 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6069 16 = true := blkChk_join _ _ _ _ _ 6069 15 1 h14 okB6084
  exact h15
end E1.C284X
