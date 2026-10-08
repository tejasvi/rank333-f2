module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB83 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB84 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 84 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB85 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 85 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB86 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 86 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB87 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 87 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB88 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 88 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB89 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 89 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB90 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 90 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB91 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 91 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG8 : glueChkR lits W 83 9 = true := by
  rw [← glueChkRN_eq lits W 7747 83 lenT]; decide +kernel
theorem okM8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 1 = true := okB83
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 2 = true := blkChk_join _ _ _ _ _ 83 1 1 h0 okB84
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 3 = true := blkChk_join _ _ _ _ _ 83 2 1 h1 okB85
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 4 = true := blkChk_join _ _ _ _ _ 83 3 1 h2 okB86
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 5 = true := blkChk_join _ _ _ _ _ 83 4 1 h3 okB87
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 6 = true := blkChk_join _ _ _ _ _ 83 5 1 h4 okB88
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 7 = true := blkChk_join _ _ _ _ _ 83 6 1 h5 okB89
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 8 = true := blkChk_join _ _ _ _ _ 83 7 1 h6 okB90
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 83 9 = true := blkChk_join _ _ _ _ _ 83 8 1 h7 okB91
  exact h8
end E1.C284X
