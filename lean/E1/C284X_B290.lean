module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2669 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2669 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2670 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2670 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2671 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2671 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2672 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2672 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2673 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2673 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2674 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2674 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2675 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2675 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG290 : glueChkR lits W 2669 7 = true := by
  rw [← glueChkRN_eq lits W 7747 2669 lenT]; decide +kernel
theorem okM290 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2669 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2669 1 = true := okB2669
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2669 2 = true := blkChk_join _ _ _ _ _ 2669 1 1 h0 okB2670
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2669 3 = true := blkChk_join _ _ _ _ _ 2669 2 1 h1 okB2671
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2669 4 = true := blkChk_join _ _ _ _ _ 2669 3 1 h2 okB2672
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2669 5 = true := blkChk_join _ _ _ _ _ 2669 4 1 h3 okB2673
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2669 6 = true := blkChk_join _ _ _ _ _ 2669 5 1 h4 okB2674
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2669 7 = true := blkChk_join _ _ _ _ _ 2669 6 1 h5 okB2675
  exact h6
end E1.C284X
