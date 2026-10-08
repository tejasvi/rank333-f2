module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6170 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6171 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6171 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6172 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6172 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6173 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6173 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6174 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6174 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6175 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6175 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6176 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6176 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6177 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6177 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6178 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6178 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG646 : glueChkR lits W 6170 9 = true := by
  rw [← glueChkRN_eq lits W 7747 6170 lenT]; decide +kernel
theorem okM646 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 1 = true := okB6170
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 2 = true := blkChk_join _ _ _ _ _ 6170 1 1 h0 okB6171
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 3 = true := blkChk_join _ _ _ _ _ 6170 2 1 h1 okB6172
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 4 = true := blkChk_join _ _ _ _ _ 6170 3 1 h2 okB6173
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 5 = true := blkChk_join _ _ _ _ _ 6170 4 1 h3 okB6174
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 6 = true := blkChk_join _ _ _ _ _ 6170 5 1 h4 okB6175
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 7 = true := blkChk_join _ _ _ _ _ 6170 6 1 h5 okB6176
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 8 = true := blkChk_join _ _ _ _ _ 6170 7 1 h6 okB6177
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6170 9 = true := blkChk_join _ _ _ _ _ 6170 8 1 h7 okB6178
  exact h8
end E1.C284X
