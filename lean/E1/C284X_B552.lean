module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5180 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5181 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5181 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5182 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5182 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5183 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5183 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5184 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5184 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5185 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5185 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5186 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5186 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5187 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5187 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5188 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5188 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5189 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5189 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5190 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5190 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5191 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5191 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG552 : glueChkR lits W 5180 12 = true := by
  rw [← glueChkRN_eq lits W 7747 5180 lenT]; decide +kernel
theorem okM552 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 1 = true := okB5180
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 2 = true := blkChk_join _ _ _ _ _ 5180 1 1 h0 okB5181
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 3 = true := blkChk_join _ _ _ _ _ 5180 2 1 h1 okB5182
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 4 = true := blkChk_join _ _ _ _ _ 5180 3 1 h2 okB5183
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 5 = true := blkChk_join _ _ _ _ _ 5180 4 1 h3 okB5184
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 6 = true := blkChk_join _ _ _ _ _ 5180 5 1 h4 okB5185
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 7 = true := blkChk_join _ _ _ _ _ 5180 6 1 h5 okB5186
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 8 = true := blkChk_join _ _ _ _ _ 5180 7 1 h6 okB5187
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 9 = true := blkChk_join _ _ _ _ _ 5180 8 1 h7 okB5188
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 10 = true := blkChk_join _ _ _ _ _ 5180 9 1 h8 okB5189
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 11 = true := blkChk_join _ _ _ _ _ 5180 10 1 h9 okB5190
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5180 12 = true := blkChk_join _ _ _ _ _ 5180 11 1 h10 okB5191
  exact h11
end E1.C284X
