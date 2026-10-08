module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4824 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4825 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4825 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4826 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4826 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4827 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4827 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4828 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4828 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4829 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4829 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4830 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4830 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4831 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4831 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4832 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4832 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4833 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4833 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4834 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4834 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4835 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4835 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG508 : glueChkR lits W 4824 12 = true := by
  rw [← glueChkRN_eq lits W 7747 4824 lenT]; decide +kernel
theorem okM508 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 1 = true := okB4824
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 2 = true := blkChk_join _ _ _ _ _ 4824 1 1 h0 okB4825
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 3 = true := blkChk_join _ _ _ _ _ 4824 2 1 h1 okB4826
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 4 = true := blkChk_join _ _ _ _ _ 4824 3 1 h2 okB4827
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 5 = true := blkChk_join _ _ _ _ _ 4824 4 1 h3 okB4828
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 6 = true := blkChk_join _ _ _ _ _ 4824 5 1 h4 okB4829
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 7 = true := blkChk_join _ _ _ _ _ 4824 6 1 h5 okB4830
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 8 = true := blkChk_join _ _ _ _ _ 4824 7 1 h6 okB4831
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 9 = true := blkChk_join _ _ _ _ _ 4824 8 1 h7 okB4832
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 10 = true := blkChk_join _ _ _ _ _ 4824 9 1 h8 okB4833
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 11 = true := blkChk_join _ _ _ _ _ 4824 10 1 h9 okB4834
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4824 12 = true := blkChk_join _ _ _ _ _ 4824 11 1 h10 okB4835
  exact h11
end E1.C284X
