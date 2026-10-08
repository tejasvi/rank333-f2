module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB324 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 324 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB325 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 325 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB326 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 326 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB327 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 327 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB328 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 328 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB329 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 329 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB330 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 330 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG33 : glueChkR lits W 324 7 = true := by
  rw [← glueChkRN_eq lits W 7747 324 lenT]; decide +kernel
theorem okM33 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 324 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 324 1 = true := okB324
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 324 2 = true := blkChk_join _ _ _ _ _ 324 1 1 h0 okB325
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 324 3 = true := blkChk_join _ _ _ _ _ 324 2 1 h1 okB326
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 324 4 = true := blkChk_join _ _ _ _ _ 324 3 1 h2 okB327
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 324 5 = true := blkChk_join _ _ _ _ _ 324 4 1 h3 okB328
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 324 6 = true := blkChk_join _ _ _ _ _ 324 5 1 h4 okB329
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 324 7 = true := blkChk_join _ _ _ _ _ 324 6 1 h5 okB330
  exact h6
end E1.C284X
