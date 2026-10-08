module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7225 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7226 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7226 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7227 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7227 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7228 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7228 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7229 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7229 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7230 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7230 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7231 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7231 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7232 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7232 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7233 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7233 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7234 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7234 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG736 : glueChkR lits W 7225 10 = true := by
  rw [← glueChkRN_eq lits W 7747 7225 lenT]; decide +kernel
theorem okM736 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 1 = true := okB7225
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 2 = true := blkChk_join _ _ _ _ _ 7225 1 1 h0 okB7226
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 3 = true := blkChk_join _ _ _ _ _ 7225 2 1 h1 okB7227
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 4 = true := blkChk_join _ _ _ _ _ 7225 3 1 h2 okB7228
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 5 = true := blkChk_join _ _ _ _ _ 7225 4 1 h3 okB7229
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 6 = true := blkChk_join _ _ _ _ _ 7225 5 1 h4 okB7230
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 7 = true := blkChk_join _ _ _ _ _ 7225 6 1 h5 okB7231
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 8 = true := blkChk_join _ _ _ _ _ 7225 7 1 h6 okB7232
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 9 = true := blkChk_join _ _ _ _ _ 7225 8 1 h7 okB7233
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7225 10 = true := blkChk_join _ _ _ _ _ 7225 9 1 h8 okB7234
  exact h9
end E1.C284X
