module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3242 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3243 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3243 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3244 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3244 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3245 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3245 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3246 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3246 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3247 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3247 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3248 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3248 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3249 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3249 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3250 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3250 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3251 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3251 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG318 : glueChkR lits W 3242 10 = true := by
  rw [← glueChkRN_eq lits W 8596 3242 lenT]; decide +kernel
theorem okM318 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 1 = true := okB3242
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 2 = true := blkChk_join _ _ _ _ _ 3242 1 1 h0 okB3243
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 3 = true := blkChk_join _ _ _ _ _ 3242 2 1 h1 okB3244
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 4 = true := blkChk_join _ _ _ _ _ 3242 3 1 h2 okB3245
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 5 = true := blkChk_join _ _ _ _ _ 3242 4 1 h3 okB3246
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 6 = true := blkChk_join _ _ _ _ _ 3242 5 1 h4 okB3247
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 7 = true := blkChk_join _ _ _ _ _ 3242 6 1 h5 okB3248
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 8 = true := blkChk_join _ _ _ _ _ 3242 7 1 h6 okB3249
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 9 = true := blkChk_join _ _ _ _ _ 3242 8 1 h7 okB3250
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3242 10 = true := blkChk_join _ _ _ _ _ 3242 9 1 h8 okB3251
  exact h9
end E1.C236X
