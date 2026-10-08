module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB455 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 455 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB456 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 456 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB457 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 457 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB458 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 458 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB459 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 459 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB460 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 460 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB461 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 461 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG52 : glueChkR lits W 455 7 = true := by
  rw [← glueChkRN_eq lits W 7747 455 lenT]; decide +kernel
theorem okM52 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 455 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 455 1 = true := okB455
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 455 2 = true := blkChk_join _ _ _ _ _ 455 1 1 h0 okB456
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 455 3 = true := blkChk_join _ _ _ _ _ 455 2 1 h1 okB457
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 455 4 = true := blkChk_join _ _ _ _ _ 455 3 1 h2 okB458
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 455 5 = true := blkChk_join _ _ _ _ _ 455 4 1 h3 okB459
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 455 6 = true := blkChk_join _ _ _ _ _ 455 5 1 h4 okB460
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 455 7 = true := blkChk_join _ _ _ _ _ 455 6 1 h5 okB461
  exact h6
end E1.C284X
