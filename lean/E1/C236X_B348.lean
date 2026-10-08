module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3580 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3580 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3581 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3581 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3582 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3582 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3583 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3583 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3584 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3584 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3585 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3585 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG348 : glueChkR lits W 3580 6 = true := by
  rw [← glueChkRN_eq lits W 8596 3580 lenT]; decide +kernel
theorem okM348 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3580 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3580 1 = true := okB3580
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3580 2 = true := blkChk_join _ _ _ _ _ 3580 1 1 h0 okB3581
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3580 3 = true := blkChk_join _ _ _ _ _ 3580 2 1 h1 okB3582
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3580 4 = true := blkChk_join _ _ _ _ _ 3580 3 1 h2 okB3583
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3580 5 = true := blkChk_join _ _ _ _ _ 3580 4 1 h3 okB3584
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3580 6 = true := blkChk_join _ _ _ _ _ 3580 5 1 h4 okB3585
  exact h5
end E1.C236X
