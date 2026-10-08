module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6301 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6301 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6302 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6302 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6303 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6303 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6304 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6304 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6305 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6305 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6306 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6306 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6307 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6307 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6308 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6308 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG601 : glueChkR lits W 6301 8 = true := by
  rw [← glueChkRN_eq lits W 8596 6301 lenT]; decide +kernel
theorem okM601 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6301 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6301 1 = true := okB6301
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6301 2 = true := blkChk_join _ _ _ _ _ 6301 1 1 h0 okB6302
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6301 3 = true := blkChk_join _ _ _ _ _ 6301 2 1 h1 okB6303
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6301 4 = true := blkChk_join _ _ _ _ _ 6301 3 1 h2 okB6304
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6301 5 = true := blkChk_join _ _ _ _ _ 6301 4 1 h3 okB6305
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6301 6 = true := blkChk_join _ _ _ _ _ 6301 5 1 h4 okB6306
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6301 7 = true := blkChk_join _ _ _ _ _ 6301 6 1 h5 okB6307
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6301 8 = true := blkChk_join _ _ _ _ _ 6301 7 1 h6 okB6308
  exact h7
end E1.C236X
