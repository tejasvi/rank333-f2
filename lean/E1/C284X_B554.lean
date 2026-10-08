module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5203 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5204 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5204 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5205 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5205 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5206 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5206 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5207 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5207 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5208 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5208 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5209 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5209 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5210 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5210 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5211 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5211 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5212 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5212 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG554 : glueChkR lits W 5203 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5203 lenT]; decide +kernel
theorem okM554 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 1 = true := okB5203
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 2 = true := blkChk_join _ _ _ _ _ 5203 1 1 h0 okB5204
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 3 = true := blkChk_join _ _ _ _ _ 5203 2 1 h1 okB5205
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 4 = true := blkChk_join _ _ _ _ _ 5203 3 1 h2 okB5206
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 5 = true := blkChk_join _ _ _ _ _ 5203 4 1 h3 okB5207
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 6 = true := blkChk_join _ _ _ _ _ 5203 5 1 h4 okB5208
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 7 = true := blkChk_join _ _ _ _ _ 5203 6 1 h5 okB5209
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 8 = true := blkChk_join _ _ _ _ _ 5203 7 1 h6 okB5210
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 9 = true := blkChk_join _ _ _ _ _ 5203 8 1 h7 okB5211
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5203 10 = true := blkChk_join _ _ _ _ _ 5203 9 1 h8 okB5212
  exact h9
end E1.C284X
