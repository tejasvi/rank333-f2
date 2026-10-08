module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5213 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5213 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5214 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5214 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5215 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5215 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5216 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5216 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5217 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5217 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5218 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5218 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5219 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5219 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5220 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5220 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG555 : glueChkR lits W 5213 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5213 lenT]; decide +kernel
theorem okM555 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5213 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5213 1 = true := okB5213
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5213 2 = true := blkChk_join _ _ _ _ _ 5213 1 1 h0 okB5214
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5213 3 = true := blkChk_join _ _ _ _ _ 5213 2 1 h1 okB5215
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5213 4 = true := blkChk_join _ _ _ _ _ 5213 3 1 h2 okB5216
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5213 5 = true := blkChk_join _ _ _ _ _ 5213 4 1 h3 okB5217
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5213 6 = true := blkChk_join _ _ _ _ _ 5213 5 1 h4 okB5218
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5213 7 = true := blkChk_join _ _ _ _ _ 5213 6 1 h5 okB5219
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5213 8 = true := blkChk_join _ _ _ _ _ 5213 7 1 h6 okB5220
  exact h7
end E1.C284X
