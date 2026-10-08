module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6610 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6611 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6611 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6612 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6612 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6613 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6613 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6614 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6614 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6615 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6615 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6616 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6616 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6617 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6617 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6618 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6618 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG686 : glueChkR lits W 6610 9 = true := by
  rw [← glueChkRN_eq lits W 7747 6610 lenT]; decide +kernel
theorem okM686 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 1 = true := okB6610
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 2 = true := blkChk_join _ _ _ _ _ 6610 1 1 h0 okB6611
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 3 = true := blkChk_join _ _ _ _ _ 6610 2 1 h1 okB6612
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 4 = true := blkChk_join _ _ _ _ _ 6610 3 1 h2 okB6613
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 5 = true := blkChk_join _ _ _ _ _ 6610 4 1 h3 okB6614
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 6 = true := blkChk_join _ _ _ _ _ 6610 5 1 h4 okB6615
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 7 = true := blkChk_join _ _ _ _ _ 6610 6 1 h5 okB6616
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 8 = true := blkChk_join _ _ _ _ _ 6610 7 1 h6 okB6617
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6610 9 = true := blkChk_join _ _ _ _ _ 6610 8 1 h7 okB6618
  exact h8
end E1.C284X
