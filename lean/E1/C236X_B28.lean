module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB295 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB296 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 296 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB297 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 297 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB298 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 298 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB299 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 299 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB300 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 300 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB301 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 301 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB302 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 302 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB303 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 303 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG28 : glueChkR lits W 295 9 = true := by
  rw [← glueChkRN_eq lits W 8596 295 lenT]; decide +kernel
theorem okM28 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 1 = true := okB295
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 2 = true := blkChk_join _ _ _ _ _ 295 1 1 h0 okB296
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 3 = true := blkChk_join _ _ _ _ _ 295 2 1 h1 okB297
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 4 = true := blkChk_join _ _ _ _ _ 295 3 1 h2 okB298
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 5 = true := blkChk_join _ _ _ _ _ 295 4 1 h3 okB299
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 6 = true := blkChk_join _ _ _ _ _ 295 5 1 h4 okB300
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 7 = true := blkChk_join _ _ _ _ _ 295 6 1 h5 okB301
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 8 = true := blkChk_join _ _ _ _ _ 295 7 1 h6 okB302
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 295 9 = true := blkChk_join _ _ _ _ _ 295 8 1 h7 okB303
  exact h8
end E1.C236X
