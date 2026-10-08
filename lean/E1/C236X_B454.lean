module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4639 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4639 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4640 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4640 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4641 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4641 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4642 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4642 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4643 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4643 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4644 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4644 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG454 : glueChkR lits W 4639 6 = true := by
  rw [← glueChkRN_eq lits W 8596 4639 lenT]; decide +kernel
theorem okM454 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4639 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4639 1 = true := okB4639
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4639 2 = true := blkChk_join _ _ _ _ _ 4639 1 1 h0 okB4640
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4639 3 = true := blkChk_join _ _ _ _ _ 4639 2 1 h1 okB4641
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4639 4 = true := blkChk_join _ _ _ _ _ 4639 3 1 h2 okB4642
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4639 5 = true := blkChk_join _ _ _ _ _ 4639 4 1 h3 okB4643
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4639 6 = true := blkChk_join _ _ _ _ _ 4639 5 1 h4 okB4644
  exact h5
end E1.C236X
