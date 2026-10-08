module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3202 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3203 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3203 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3204 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3204 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3205 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3205 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3206 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3206 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3207 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3207 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3208 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3208 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3209 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3209 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3210 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3210 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3211 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3211 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG342 : glueChkR lits W 3202 10 = true := by
  rw [← glueChkRN_eq lits W 7747 3202 lenT]; decide +kernel
theorem okM342 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 1 = true := okB3202
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 2 = true := blkChk_join _ _ _ _ _ 3202 1 1 h0 okB3203
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 3 = true := blkChk_join _ _ _ _ _ 3202 2 1 h1 okB3204
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 4 = true := blkChk_join _ _ _ _ _ 3202 3 1 h2 okB3205
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 5 = true := blkChk_join _ _ _ _ _ 3202 4 1 h3 okB3206
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 6 = true := blkChk_join _ _ _ _ _ 3202 5 1 h4 okB3207
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 7 = true := blkChk_join _ _ _ _ _ 3202 6 1 h5 okB3208
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 8 = true := blkChk_join _ _ _ _ _ 3202 7 1 h6 okB3209
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 9 = true := blkChk_join _ _ _ _ _ 3202 8 1 h7 okB3210
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3202 10 = true := blkChk_join _ _ _ _ _ 3202 9 1 h8 okB3211
  exact h9
end E1.C284X
