module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6227 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6228 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6228 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6229 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6229 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6230 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6230 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6231 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6231 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6232 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6232 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6233 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6233 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6234 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6234 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6235 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6235 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG652 : glueChkR lits W 6227 9 = true := by
  rw [← glueChkRN_eq lits W 7747 6227 lenT]; decide +kernel
theorem okM652 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 1 = true := okB6227
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 2 = true := blkChk_join _ _ _ _ _ 6227 1 1 h0 okB6228
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 3 = true := blkChk_join _ _ _ _ _ 6227 2 1 h1 okB6229
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 4 = true := blkChk_join _ _ _ _ _ 6227 3 1 h2 okB6230
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 5 = true := blkChk_join _ _ _ _ _ 6227 4 1 h3 okB6231
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 6 = true := blkChk_join _ _ _ _ _ 6227 5 1 h4 okB6232
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 7 = true := blkChk_join _ _ _ _ _ 6227 6 1 h5 okB6233
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 8 = true := blkChk_join _ _ _ _ _ 6227 7 1 h6 okB6234
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6227 9 = true := blkChk_join _ _ _ _ _ 6227 8 1 h7 okB6235
  exact h8
end E1.C284X
