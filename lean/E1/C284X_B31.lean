module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB307 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB308 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 308 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB309 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 309 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB310 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 310 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB311 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 311 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB312 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 312 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB313 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 313 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB314 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 314 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB315 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 315 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG31 : glueChkR lits W 307 9 = true := by
  rw [← glueChkRN_eq lits W 7747 307 lenT]; decide +kernel
theorem okM31 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 1 = true := okB307
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 2 = true := blkChk_join _ _ _ _ _ 307 1 1 h0 okB308
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 3 = true := blkChk_join _ _ _ _ _ 307 2 1 h1 okB309
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 4 = true := blkChk_join _ _ _ _ _ 307 3 1 h2 okB310
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 5 = true := blkChk_join _ _ _ _ _ 307 4 1 h3 okB311
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 6 = true := blkChk_join _ _ _ _ _ 307 5 1 h4 okB312
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 7 = true := blkChk_join _ _ _ _ _ 307 6 1 h5 okB313
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 8 = true := blkChk_join _ _ _ _ _ 307 7 1 h6 okB314
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 307 9 = true := blkChk_join _ _ _ _ _ 307 8 1 h7 okB315
  exact h8
end E1.C284X
