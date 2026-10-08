module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2213 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2214 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2214 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2215 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2215 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2216 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2216 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2217 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2217 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2218 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2218 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2219 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2219 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2220 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2220 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2221 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2221 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2222 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2222 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2223 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2223 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2224 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2224 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG244 : glueChkR lits W 2213 12 = true := by
  rw [← glueChkRN_eq lits W 7747 2213 lenT]; decide +kernel
theorem okM244 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 1 = true := okB2213
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 2 = true := blkChk_join _ _ _ _ _ 2213 1 1 h0 okB2214
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 3 = true := blkChk_join _ _ _ _ _ 2213 2 1 h1 okB2215
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 4 = true := blkChk_join _ _ _ _ _ 2213 3 1 h2 okB2216
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 5 = true := blkChk_join _ _ _ _ _ 2213 4 1 h3 okB2217
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 6 = true := blkChk_join _ _ _ _ _ 2213 5 1 h4 okB2218
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 7 = true := blkChk_join _ _ _ _ _ 2213 6 1 h5 okB2219
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 8 = true := blkChk_join _ _ _ _ _ 2213 7 1 h6 okB2220
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 9 = true := blkChk_join _ _ _ _ _ 2213 8 1 h7 okB2221
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 10 = true := blkChk_join _ _ _ _ _ 2213 9 1 h8 okB2222
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 11 = true := blkChk_join _ _ _ _ _ 2213 10 1 h9 okB2223
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2213 12 = true := blkChk_join _ _ _ _ _ 2213 11 1 h10 okB2224
  exact h11
end E1.C284X
