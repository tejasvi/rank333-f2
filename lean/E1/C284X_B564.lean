module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5304 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5305 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5305 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5306 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5306 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5307 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5307 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5308 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5308 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5309 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5309 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5310 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5310 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5311 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5311 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5312 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5312 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5313 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5313 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG564 : glueChkR lits W 5304 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5304 lenT]; decide +kernel
theorem okM564 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 1 = true := okB5304
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 2 = true := blkChk_join _ _ _ _ _ 5304 1 1 h0 okB5305
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 3 = true := blkChk_join _ _ _ _ _ 5304 2 1 h1 okB5306
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 4 = true := blkChk_join _ _ _ _ _ 5304 3 1 h2 okB5307
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 5 = true := blkChk_join _ _ _ _ _ 5304 4 1 h3 okB5308
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 6 = true := blkChk_join _ _ _ _ _ 5304 5 1 h4 okB5309
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 7 = true := blkChk_join _ _ _ _ _ 5304 6 1 h5 okB5310
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 8 = true := blkChk_join _ _ _ _ _ 5304 7 1 h6 okB5311
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 9 = true := blkChk_join _ _ _ _ _ 5304 8 1 h7 okB5312
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5304 10 = true := blkChk_join _ _ _ _ _ 5304 9 1 h8 okB5313
  exact h9
end E1.C284X
