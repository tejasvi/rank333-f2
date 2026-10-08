module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3304 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3304 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3305 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3305 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3306 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3306 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3307 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3307 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3308 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3308 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3309 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3309 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3310 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3310 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3311 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3311 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG325 : glueChkR lits W 3304 8 = true := by
  rw [← glueChkRN_eq lits W 8596 3304 lenT]; decide +kernel
theorem okM325 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3304 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3304 1 = true := okB3304
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3304 2 = true := blkChk_join _ _ _ _ _ 3304 1 1 h0 okB3305
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3304 3 = true := blkChk_join _ _ _ _ _ 3304 2 1 h1 okB3306
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3304 4 = true := blkChk_join _ _ _ _ _ 3304 3 1 h2 okB3307
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3304 5 = true := blkChk_join _ _ _ _ _ 3304 4 1 h3 okB3308
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3304 6 = true := blkChk_join _ _ _ _ _ 3304 5 1 h4 okB3309
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3304 7 = true := blkChk_join _ _ _ _ _ 3304 6 1 h5 okB3310
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3304 8 = true := blkChk_join _ _ _ _ _ 3304 7 1 h6 okB3311
  exact h7
end E1.C236X
