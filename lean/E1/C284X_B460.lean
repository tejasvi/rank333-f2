module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4322 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4322 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4323 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4323 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4324 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4324 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4325 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4325 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4326 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4326 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4327 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4327 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG460 : glueChkR lits W 4322 6 = true := by
  rw [← glueChkRN_eq lits W 7747 4322 lenT]; decide +kernel
theorem okM460 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4322 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4322 1 = true := okB4322
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4322 2 = true := blkChk_join _ _ _ _ _ 4322 1 1 h0 okB4323
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4322 3 = true := blkChk_join _ _ _ _ _ 4322 2 1 h1 okB4324
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4322 4 = true := blkChk_join _ _ _ _ _ 4322 3 1 h2 okB4325
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4322 5 = true := blkChk_join _ _ _ _ _ 4322 4 1 h3 okB4326
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4322 6 = true := blkChk_join _ _ _ _ _ 4322 5 1 h4 okB4327
  exact h5
end E1.C284X
