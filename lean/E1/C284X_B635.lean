module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6052 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6053 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6053 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6054 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6054 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6055 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6055 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6056 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6056 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6057 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6057 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6058 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6058 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6059 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6059 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6060 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6060 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG635 : glueChkR lits W 6052 9 = true := by
  rw [← glueChkRN_eq lits W 7747 6052 lenT]; decide +kernel
theorem okM635 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 1 = true := okB6052
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 2 = true := blkChk_join _ _ _ _ _ 6052 1 1 h0 okB6053
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 3 = true := blkChk_join _ _ _ _ _ 6052 2 1 h1 okB6054
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 4 = true := blkChk_join _ _ _ _ _ 6052 3 1 h2 okB6055
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 5 = true := blkChk_join _ _ _ _ _ 6052 4 1 h3 okB6056
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 6 = true := blkChk_join _ _ _ _ _ 6052 5 1 h4 okB6057
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 7 = true := blkChk_join _ _ _ _ _ 6052 6 1 h5 okB6058
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 8 = true := blkChk_join _ _ _ _ _ 6052 7 1 h6 okB6059
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6052 9 = true := blkChk_join _ _ _ _ _ 6052 8 1 h7 okB6060
  exact h8
end E1.C284X
