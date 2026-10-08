module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5136 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5137 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5137 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5138 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5138 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5139 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5139 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5140 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5140 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5141 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5141 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5142 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5142 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5143 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5143 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5144 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5144 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG547 : glueChkR lits W 5136 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5136 lenT]; decide +kernel
theorem okM547 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 1 = true := okB5136
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 2 = true := blkChk_join _ _ _ _ _ 5136 1 1 h0 okB5137
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 3 = true := blkChk_join _ _ _ _ _ 5136 2 1 h1 okB5138
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 4 = true := blkChk_join _ _ _ _ _ 5136 3 1 h2 okB5139
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 5 = true := blkChk_join _ _ _ _ _ 5136 4 1 h3 okB5140
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 6 = true := blkChk_join _ _ _ _ _ 5136 5 1 h4 okB5141
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 7 = true := blkChk_join _ _ _ _ _ 5136 6 1 h5 okB5142
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 8 = true := blkChk_join _ _ _ _ _ 5136 7 1 h6 okB5143
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5136 9 = true := blkChk_join _ _ _ _ _ 5136 8 1 h7 okB5144
  exact h8
end E1.C284X
