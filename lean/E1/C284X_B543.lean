module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5099 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5099 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5100 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5100 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5101 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5101 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5102 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5102 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5103 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5103 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5104 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5104 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5105 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5105 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5106 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5106 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG543 : glueChkR lits W 5099 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5099 lenT]; decide +kernel
theorem okM543 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5099 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5099 1 = true := okB5099
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5099 2 = true := blkChk_join _ _ _ _ _ 5099 1 1 h0 okB5100
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5099 3 = true := blkChk_join _ _ _ _ _ 5099 2 1 h1 okB5101
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5099 4 = true := blkChk_join _ _ _ _ _ 5099 3 1 h2 okB5102
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5099 5 = true := blkChk_join _ _ _ _ _ 5099 4 1 h3 okB5103
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5099 6 = true := blkChk_join _ _ _ _ _ 5099 5 1 h4 okB5104
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5099 7 = true := blkChk_join _ _ _ _ _ 5099 6 1 h5 okB5105
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5099 8 = true := blkChk_join _ _ _ _ _ 5099 7 1 h6 okB5106
  exact h7
end E1.C284X
