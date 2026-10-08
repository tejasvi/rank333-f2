module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2707 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2707 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2708 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2708 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2709 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2709 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2710 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2710 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2711 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2711 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2712 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2712 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2713 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2713 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2714 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2714 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG294 : glueChkR lits W 2707 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2707 lenT]; decide +kernel
theorem okM294 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2707 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2707 1 = true := okB2707
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2707 2 = true := blkChk_join _ _ _ _ _ 2707 1 1 h0 okB2708
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2707 3 = true := blkChk_join _ _ _ _ _ 2707 2 1 h1 okB2709
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2707 4 = true := blkChk_join _ _ _ _ _ 2707 3 1 h2 okB2710
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2707 5 = true := blkChk_join _ _ _ _ _ 2707 4 1 h3 okB2711
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2707 6 = true := blkChk_join _ _ _ _ _ 2707 5 1 h4 okB2712
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2707 7 = true := blkChk_join _ _ _ _ _ 2707 6 1 h5 okB2713
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2707 8 = true := blkChk_join _ _ _ _ _ 2707 7 1 h6 okB2714
  exact h7
end E1.C284X
