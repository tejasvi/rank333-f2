module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5170 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5171 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5171 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5172 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5172 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5173 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5173 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5174 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5174 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5175 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5175 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5176 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5176 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5177 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5177 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5178 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5178 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5179 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5179 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG551 : glueChkR lits W 5170 10 = true := by
  rw [← glueChkRN_eq lits W 7747 5170 lenT]; decide +kernel
theorem okM551 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 1 = true := okB5170
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 2 = true := blkChk_join _ _ _ _ _ 5170 1 1 h0 okB5171
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 3 = true := blkChk_join _ _ _ _ _ 5170 2 1 h1 okB5172
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 4 = true := blkChk_join _ _ _ _ _ 5170 3 1 h2 okB5173
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 5 = true := blkChk_join _ _ _ _ _ 5170 4 1 h3 okB5174
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 6 = true := blkChk_join _ _ _ _ _ 5170 5 1 h4 okB5175
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 7 = true := blkChk_join _ _ _ _ _ 5170 6 1 h5 okB5176
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 8 = true := blkChk_join _ _ _ _ _ 5170 7 1 h6 okB5177
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 9 = true := blkChk_join _ _ _ _ _ 5170 8 1 h7 okB5178
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5170 10 = true := blkChk_join _ _ _ _ _ 5170 9 1 h8 okB5179
  exact h9
end E1.C284X
