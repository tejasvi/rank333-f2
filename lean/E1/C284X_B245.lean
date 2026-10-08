module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2225 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2225 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2226 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2226 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2227 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2227 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2228 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2228 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2229 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2229 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2230 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2230 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2231 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2231 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2232 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2232 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG245 : glueChkR lits W 2225 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2225 lenT]; decide +kernel
theorem okM245 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2225 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2225 1 = true := okB2225
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2225 2 = true := blkChk_join _ _ _ _ _ 2225 1 1 h0 okB2226
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2225 3 = true := blkChk_join _ _ _ _ _ 2225 2 1 h1 okB2227
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2225 4 = true := blkChk_join _ _ _ _ _ 2225 3 1 h2 okB2228
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2225 5 = true := blkChk_join _ _ _ _ _ 2225 4 1 h3 okB2229
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2225 6 = true := blkChk_join _ _ _ _ _ 2225 5 1 h4 okB2230
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2225 7 = true := blkChk_join _ _ _ _ _ 2225 6 1 h5 okB2231
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2225 8 = true := blkChk_join _ _ _ _ _ 2225 7 1 h6 okB2232
  exact h7
end E1.C284X
