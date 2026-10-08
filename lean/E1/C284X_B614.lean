module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5829 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5829 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5830 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5830 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5831 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5831 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5832 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5832 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5833 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5833 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5834 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5834 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG614 : glueChkR lits W 5829 6 = true := by
  rw [← glueChkRN_eq lits W 7747 5829 lenT]; decide +kernel
theorem okM614 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5829 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5829 1 = true := okB5829
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5829 2 = true := blkChk_join _ _ _ _ _ 5829 1 1 h0 okB5830
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5829 3 = true := blkChk_join _ _ _ _ _ 5829 2 1 h1 okB5831
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5829 4 = true := blkChk_join _ _ _ _ _ 5829 3 1 h2 okB5832
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5829 5 = true := blkChk_join _ _ _ _ _ 5829 4 1 h3 okB5833
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5829 6 = true := blkChk_join _ _ _ _ _ 5829 5 1 h4 okB5834
  exact h5
end E1.C284X
