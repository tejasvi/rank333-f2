module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5192 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5193 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5193 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5194 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5194 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5195 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5195 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5196 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5196 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5197 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5197 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5198 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5198 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5199 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5199 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5200 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5200 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5201 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5201 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5202 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5202 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG553 : glueChkR lits W 5192 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5192 lenT]; decide +kernel
theorem okM553 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 1 = true := okB5192
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 2 = true := blkChk_join _ _ _ _ _ 5192 1 1 h0 okB5193
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 3 = true := blkChk_join _ _ _ _ _ 5192 2 1 h1 okB5194
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 4 = true := blkChk_join _ _ _ _ _ 5192 3 1 h2 okB5195
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 5 = true := blkChk_join _ _ _ _ _ 5192 4 1 h3 okB5196
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 6 = true := blkChk_join _ _ _ _ _ 5192 5 1 h4 okB5197
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 7 = true := blkChk_join _ _ _ _ _ 5192 6 1 h5 okB5198
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 8 = true := blkChk_join _ _ _ _ _ 5192 7 1 h6 okB5199
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 9 = true := blkChk_join _ _ _ _ _ 5192 8 1 h7 okB5200
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 10 = true := blkChk_join _ _ _ _ _ 5192 9 1 h8 okB5201
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5192 11 = true := blkChk_join _ _ _ _ _ 5192 10 1 h9 okB5202
  exact h10
end E1.C284X
