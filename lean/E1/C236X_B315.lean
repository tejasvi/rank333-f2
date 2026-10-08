module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3213 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3214 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3214 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3215 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3215 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3216 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3216 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3217 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3217 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3218 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3218 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3219 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3219 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3220 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3220 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3221 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3221 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3222 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3222 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3223 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3223 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3224 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3224 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG315 : glueChkR lits W 3213 12 = true := by
  rw [← glueChkRN_eq lits W 8596 3213 lenT]; decide +kernel
theorem okM315 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 1 = true := okB3213
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 2 = true := blkChk_join _ _ _ _ _ 3213 1 1 h0 okB3214
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 3 = true := blkChk_join _ _ _ _ _ 3213 2 1 h1 okB3215
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 4 = true := blkChk_join _ _ _ _ _ 3213 3 1 h2 okB3216
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 5 = true := blkChk_join _ _ _ _ _ 3213 4 1 h3 okB3217
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 6 = true := blkChk_join _ _ _ _ _ 3213 5 1 h4 okB3218
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 7 = true := blkChk_join _ _ _ _ _ 3213 6 1 h5 okB3219
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 8 = true := blkChk_join _ _ _ _ _ 3213 7 1 h6 okB3220
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 9 = true := blkChk_join _ _ _ _ _ 3213 8 1 h7 okB3221
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 10 = true := blkChk_join _ _ _ _ _ 3213 9 1 h8 okB3222
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 11 = true := blkChk_join _ _ _ _ _ 3213 10 1 h9 okB3223
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3213 12 = true := blkChk_join _ _ _ _ _ 3213 11 1 h10 okB3224
  exact h11
end E1.C236X
