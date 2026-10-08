module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB401 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 401 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB402 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 402 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB403 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 403 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB404 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 404 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB405 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 405 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB406 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 406 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB407 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 407 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG43 : glueChkR lits W 401 7 = true := by
  rw [← glueChkRN_eq lits W 7747 401 lenT]; decide +kernel
theorem okM43 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 401 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 401 1 = true := okB401
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 401 2 = true := blkChk_join _ _ _ _ _ 401 1 1 h0 okB402
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 401 3 = true := blkChk_join _ _ _ _ _ 401 2 1 h1 okB403
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 401 4 = true := blkChk_join _ _ _ _ _ 401 3 1 h2 okB404
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 401 5 = true := blkChk_join _ _ _ _ _ 401 4 1 h3 okB405
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 401 6 = true := blkChk_join _ _ _ _ _ 401 5 1 h4 okB406
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 401 7 = true := blkChk_join _ _ _ _ _ 401 6 1 h5 okB407
  exact h6
end E1.C284X
