module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3252 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3253 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3253 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3254 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3254 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3255 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3255 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3256 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3256 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3257 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3257 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3258 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3258 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3259 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3259 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3260 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3260 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG319 : glueChkR lits W 3252 9 = true := by
  rw [← glueChkRN_eq lits W 8596 3252 lenT]; decide +kernel
theorem okM319 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 1 = true := okB3252
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 2 = true := blkChk_join _ _ _ _ _ 3252 1 1 h0 okB3253
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 3 = true := blkChk_join _ _ _ _ _ 3252 2 1 h1 okB3254
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 4 = true := blkChk_join _ _ _ _ _ 3252 3 1 h2 okB3255
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 5 = true := blkChk_join _ _ _ _ _ 3252 4 1 h3 okB3256
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 6 = true := blkChk_join _ _ _ _ _ 3252 5 1 h4 okB3257
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 7 = true := blkChk_join _ _ _ _ _ 3252 6 1 h5 okB3258
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 8 = true := blkChk_join _ _ _ _ _ 3252 7 1 h6 okB3259
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3252 9 = true := blkChk_join _ _ _ _ _ 3252 8 1 h7 okB3260
  exact h8
end E1.C236X
