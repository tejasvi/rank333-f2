module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3261 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3261 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3262 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3262 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3263 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3263 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3264 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3264 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3265 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3265 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3266 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3266 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG320 : glueChkR lits W 3261 6 = true := by
  rw [← glueChkRN_eq lits W 8596 3261 lenT]; decide +kernel
theorem okM320 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3261 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3261 1 = true := okB3261
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3261 2 = true := blkChk_join _ _ _ _ _ 3261 1 1 h0 okB3262
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3261 3 = true := blkChk_join _ _ _ _ _ 3261 2 1 h1 okB3263
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3261 4 = true := blkChk_join _ _ _ _ _ 3261 3 1 h2 okB3264
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3261 5 = true := blkChk_join _ _ _ _ _ 3261 4 1 h3 okB3265
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3261 6 = true := blkChk_join _ _ _ _ _ 3261 5 1 h4 okB3266
  exact h5
end E1.C236X
