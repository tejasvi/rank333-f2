module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3168 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3169 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3169 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3170 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3170 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3171 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3171 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3172 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3172 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3173 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3173 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3174 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3174 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3175 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3175 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3176 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3176 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG339 : glueChkR lits W 3168 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3168 lenT]; decide +kernel
theorem okM339 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 1 = true := okB3168
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 2 = true := blkChk_join _ _ _ _ _ 3168 1 1 h0 okB3169
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 3 = true := blkChk_join _ _ _ _ _ 3168 2 1 h1 okB3170
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 4 = true := blkChk_join _ _ _ _ _ 3168 3 1 h2 okB3171
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 5 = true := blkChk_join _ _ _ _ _ 3168 4 1 h3 okB3172
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 6 = true := blkChk_join _ _ _ _ _ 3168 5 1 h4 okB3173
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 7 = true := blkChk_join _ _ _ _ _ 3168 6 1 h5 okB3174
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 8 = true := blkChk_join _ _ _ _ _ 3168 7 1 h6 okB3175
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3168 9 = true := blkChk_join _ _ _ _ _ 3168 8 1 h7 okB3176
  exact h8
end E1.C284X
