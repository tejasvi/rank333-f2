module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4209 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4209 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4210 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4210 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4211 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4211 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4212 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4212 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4213 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4213 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4214 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4214 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4215 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4215 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4216 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4216 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG448 : glueChkR lits W 4209 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4209 lenT]; decide +kernel
theorem okM448 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4209 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4209 1 = true := okB4209
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4209 2 = true := blkChk_join _ _ _ _ _ 4209 1 1 h0 okB4210
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4209 3 = true := blkChk_join _ _ _ _ _ 4209 2 1 h1 okB4211
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4209 4 = true := blkChk_join _ _ _ _ _ 4209 3 1 h2 okB4212
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4209 5 = true := blkChk_join _ _ _ _ _ 4209 4 1 h3 okB4213
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4209 6 = true := blkChk_join _ _ _ _ _ 4209 5 1 h4 okB4214
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4209 7 = true := blkChk_join _ _ _ _ _ 4209 6 1 h5 okB4215
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4209 8 = true := blkChk_join _ _ _ _ _ 4209 7 1 h6 okB4216
  exact h7
end E1.C284X
