module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5301 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5302 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5302 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5303 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5303 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5304 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5304 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5305 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5305 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5306 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5306 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5307 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5307 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5308 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5308 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5309 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5309 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG518 : glueChkR lits W 5301 9 = true := by
  rw [← glueChkRN_eq lits W 8596 5301 lenT]; decide +kernel
theorem okM518 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 1 = true := okB5301
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 2 = true := blkChk_join _ _ _ _ _ 5301 1 1 h0 okB5302
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 3 = true := blkChk_join _ _ _ _ _ 5301 2 1 h1 okB5303
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 4 = true := blkChk_join _ _ _ _ _ 5301 3 1 h2 okB5304
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 5 = true := blkChk_join _ _ _ _ _ 5301 4 1 h3 okB5305
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 6 = true := blkChk_join _ _ _ _ _ 5301 5 1 h4 okB5306
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 7 = true := blkChk_join _ _ _ _ _ 5301 6 1 h5 okB5307
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 8 = true := blkChk_join _ _ _ _ _ 5301 7 1 h6 okB5308
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5301 9 = true := blkChk_join _ _ _ _ _ 5301 8 1 h7 okB5309
  exact h8
end E1.C236X
