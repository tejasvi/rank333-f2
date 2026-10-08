module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6414 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6414 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6415 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6415 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6416 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6416 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6417 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6417 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6418 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6418 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6419 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6419 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG668 : glueChkR lits W 6414 6 = true := by
  rw [← glueChkRN_eq lits W 7747 6414 lenT]; decide +kernel
theorem okM668 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6414 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6414 1 = true := okB6414
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6414 2 = true := blkChk_join _ _ _ _ _ 6414 1 1 h0 okB6415
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6414 3 = true := blkChk_join _ _ _ _ _ 6414 2 1 h1 okB6416
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6414 4 = true := blkChk_join _ _ _ _ _ 6414 3 1 h2 okB6417
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6414 5 = true := blkChk_join _ _ _ _ _ 6414 4 1 h3 okB6418
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6414 6 = true := blkChk_join _ _ _ _ _ 6414 5 1 h4 okB6419
  exact h5
end E1.C284X
