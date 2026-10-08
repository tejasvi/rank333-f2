module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5637 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5637 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5638 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5638 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5639 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5639 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5640 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5640 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5641 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5641 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5642 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5642 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5643 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5643 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG596 : glueChkR lits W 5637 7 = true := by
  rw [← glueChkRN_eq lits W 7747 5637 lenT]; decide +kernel
theorem okM596 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5637 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5637 1 = true := okB5637
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5637 2 = true := blkChk_join _ _ _ _ _ 5637 1 1 h0 okB5638
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5637 3 = true := blkChk_join _ _ _ _ _ 5637 2 1 h1 okB5639
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5637 4 = true := blkChk_join _ _ _ _ _ 5637 3 1 h2 okB5640
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5637 5 = true := blkChk_join _ _ _ _ _ 5637 4 1 h3 okB5641
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5637 6 = true := blkChk_join _ _ _ _ _ 5637 5 1 h4 okB5642
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5637 7 = true := blkChk_join _ _ _ _ _ 5637 6 1 h5 okB5643
  exact h6
end E1.C284X
