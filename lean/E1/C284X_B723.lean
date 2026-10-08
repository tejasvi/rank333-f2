module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7053 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7054 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7054 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7055 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7055 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7056 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7056 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7057 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7057 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7058 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7058 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7059 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7059 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7060 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7060 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7061 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7061 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7062 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7062 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7063 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7063 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG723 : glueChkR lits W 7053 11 = true := by
  rw [← glueChkRN_eq lits W 7747 7053 lenT]; decide +kernel
theorem okM723 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 1 = true := okB7053
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 2 = true := blkChk_join _ _ _ _ _ 7053 1 1 h0 okB7054
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 3 = true := blkChk_join _ _ _ _ _ 7053 2 1 h1 okB7055
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 4 = true := blkChk_join _ _ _ _ _ 7053 3 1 h2 okB7056
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 5 = true := blkChk_join _ _ _ _ _ 7053 4 1 h3 okB7057
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 6 = true := blkChk_join _ _ _ _ _ 7053 5 1 h4 okB7058
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 7 = true := blkChk_join _ _ _ _ _ 7053 6 1 h5 okB7059
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 8 = true := blkChk_join _ _ _ _ _ 7053 7 1 h6 okB7060
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 9 = true := blkChk_join _ _ _ _ _ 7053 8 1 h7 okB7061
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 10 = true := blkChk_join _ _ _ _ _ 7053 9 1 h8 okB7062
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7053 11 = true := blkChk_join _ _ _ _ _ 7053 10 1 h9 okB7063
  exact h10
end E1.C284X
