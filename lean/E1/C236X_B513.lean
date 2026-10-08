module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5259 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5260 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5260 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5261 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5261 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5262 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5262 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5263 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5263 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5264 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5264 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5265 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5265 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5266 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5266 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5267 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5267 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG513 : glueChkR lits W 5259 9 = true := by
  rw [← glueChkRN_eq lits W 8596 5259 lenT]; decide +kernel
theorem okM513 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 1 = true := okB5259
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 2 = true := blkChk_join _ _ _ _ _ 5259 1 1 h0 okB5260
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 3 = true := blkChk_join _ _ _ _ _ 5259 2 1 h1 okB5261
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 4 = true := blkChk_join _ _ _ _ _ 5259 3 1 h2 okB5262
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 5 = true := blkChk_join _ _ _ _ _ 5259 4 1 h3 okB5263
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 6 = true := blkChk_join _ _ _ _ _ 5259 5 1 h4 okB5264
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 7 = true := blkChk_join _ _ _ _ _ 5259 6 1 h5 okB5265
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 8 = true := blkChk_join _ _ _ _ _ 5259 7 1 h6 okB5266
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5259 9 = true := blkChk_join _ _ _ _ _ 5259 8 1 h7 okB5267
  exact h8
end E1.C236X
