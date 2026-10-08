module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6127 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6128 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6128 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6129 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6129 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6130 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6130 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6131 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6131 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6132 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6132 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6133 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6133 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6134 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6134 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6135 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6135 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6136 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6136 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6137 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6137 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6138 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6138 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG642 : glueChkR lits W 6127 12 = true := by
  rw [← glueChkRN_eq lits W 7747 6127 lenT]; decide +kernel
theorem okM642 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 1 = true := okB6127
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 2 = true := blkChk_join _ _ _ _ _ 6127 1 1 h0 okB6128
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 3 = true := blkChk_join _ _ _ _ _ 6127 2 1 h1 okB6129
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 4 = true := blkChk_join _ _ _ _ _ 6127 3 1 h2 okB6130
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 5 = true := blkChk_join _ _ _ _ _ 6127 4 1 h3 okB6131
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 6 = true := blkChk_join _ _ _ _ _ 6127 5 1 h4 okB6132
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 7 = true := blkChk_join _ _ _ _ _ 6127 6 1 h5 okB6133
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 8 = true := blkChk_join _ _ _ _ _ 6127 7 1 h6 okB6134
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 9 = true := blkChk_join _ _ _ _ _ 6127 8 1 h7 okB6135
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 10 = true := blkChk_join _ _ _ _ _ 6127 9 1 h8 okB6136
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 11 = true := blkChk_join _ _ _ _ _ 6127 10 1 h9 okB6137
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6127 12 = true := blkChk_join _ _ _ _ _ 6127 11 1 h10 okB6138
  exact h11
end E1.C284X
