module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5116 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5117 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5117 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5118 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5118 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5119 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5119 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5120 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5120 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5121 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5121 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5122 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5122 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5123 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5123 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5124 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5124 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5125 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5125 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5126 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5126 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG545 : glueChkR lits W 5116 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5116 lenT]; decide +kernel
theorem okM545 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 1 = true := okB5116
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 2 = true := blkChk_join _ _ _ _ _ 5116 1 1 h0 okB5117
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 3 = true := blkChk_join _ _ _ _ _ 5116 2 1 h1 okB5118
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 4 = true := blkChk_join _ _ _ _ _ 5116 3 1 h2 okB5119
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 5 = true := blkChk_join _ _ _ _ _ 5116 4 1 h3 okB5120
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 6 = true := blkChk_join _ _ _ _ _ 5116 5 1 h4 okB5121
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 7 = true := blkChk_join _ _ _ _ _ 5116 6 1 h5 okB5122
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 8 = true := blkChk_join _ _ _ _ _ 5116 7 1 h6 okB5123
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 9 = true := blkChk_join _ _ _ _ _ 5116 8 1 h7 okB5124
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 10 = true := blkChk_join _ _ _ _ _ 5116 9 1 h8 okB5125
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5116 11 = true := blkChk_join _ _ _ _ _ 5116 10 1 h9 okB5126
  exact h10
end E1.C284X
