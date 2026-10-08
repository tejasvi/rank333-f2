module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB267 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB268 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 268 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB269 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 269 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB270 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 270 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB271 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 271 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB272 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 272 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB273 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 273 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB274 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 274 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB275 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 275 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG25 : glueChkR lits W 267 9 = true := by
  rw [← glueChkRN_eq lits W 8596 267 lenT]; decide +kernel
theorem okM25 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 1 = true := okB267
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 2 = true := blkChk_join _ _ _ _ _ 267 1 1 h0 okB268
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 3 = true := blkChk_join _ _ _ _ _ 267 2 1 h1 okB269
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 4 = true := blkChk_join _ _ _ _ _ 267 3 1 h2 okB270
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 5 = true := blkChk_join _ _ _ _ _ 267 4 1 h3 okB271
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 6 = true := blkChk_join _ _ _ _ _ 267 5 1 h4 okB272
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 7 = true := blkChk_join _ _ _ _ _ 267 6 1 h5 okB273
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 8 = true := blkChk_join _ _ _ _ _ 267 7 1 h6 okB274
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 267 9 = true := blkChk_join _ _ _ _ _ 267 8 1 h7 okB275
  exact h8
end E1.C236X
