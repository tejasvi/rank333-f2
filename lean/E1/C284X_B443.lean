module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4170 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4171 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4171 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4172 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4172 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4173 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4173 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4174 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4174 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4175 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4175 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4176 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4176 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4177 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4177 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4178 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4178 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4179 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4179 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4180 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4180 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4181 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4181 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG443 : glueChkR lits W 4170 12 = true := by
  rw [← glueChkRN_eq lits W 7747 4170 lenT]; decide +kernel
theorem okM443 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 1 = true := okB4170
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 2 = true := blkChk_join _ _ _ _ _ 4170 1 1 h0 okB4171
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 3 = true := blkChk_join _ _ _ _ _ 4170 2 1 h1 okB4172
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 4 = true := blkChk_join _ _ _ _ _ 4170 3 1 h2 okB4173
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 5 = true := blkChk_join _ _ _ _ _ 4170 4 1 h3 okB4174
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 6 = true := blkChk_join _ _ _ _ _ 4170 5 1 h4 okB4175
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 7 = true := blkChk_join _ _ _ _ _ 4170 6 1 h5 okB4176
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 8 = true := blkChk_join _ _ _ _ _ 4170 7 1 h6 okB4177
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 9 = true := blkChk_join _ _ _ _ _ 4170 8 1 h7 okB4178
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 10 = true := blkChk_join _ _ _ _ _ 4170 9 1 h8 okB4179
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 11 = true := blkChk_join _ _ _ _ _ 4170 10 1 h9 okB4180
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4170 12 = true := blkChk_join _ _ _ _ _ 4170 11 1 h10 okB4181
  exact h11
end E1.C284X
