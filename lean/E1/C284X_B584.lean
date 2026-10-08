module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5514 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5514 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5515 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5515 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5516 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5516 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5517 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5517 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5518 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5518 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5519 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5519 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5520 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5520 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5521 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5521 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG584 : glueChkR lits W 5514 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5514 lenT]; decide +kernel
theorem okM584 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5514 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5514 1 = true := okB5514
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5514 2 = true := blkChk_join _ _ _ _ _ 5514 1 1 h0 okB5515
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5514 3 = true := blkChk_join _ _ _ _ _ 5514 2 1 h1 okB5516
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5514 4 = true := blkChk_join _ _ _ _ _ 5514 3 1 h2 okB5517
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5514 5 = true := blkChk_join _ _ _ _ _ 5514 4 1 h3 okB5518
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5514 6 = true := blkChk_join _ _ _ _ _ 5514 5 1 h4 okB5519
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5514 7 = true := blkChk_join _ _ _ _ _ 5514 6 1 h5 okB5520
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5514 8 = true := blkChk_join _ _ _ _ _ 5514 7 1 h6 okB5521
  exact h7
end E1.C284X
