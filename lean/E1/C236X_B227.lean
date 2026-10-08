module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2322 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2323 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2323 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2324 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2324 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2325 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2325 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2326 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2326 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2327 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2327 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2328 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2328 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2329 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2329 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2330 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2330 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG227 : glueChkR lits W 2322 9 = true := by
  rw [← glueChkRN_eq lits W 8596 2322 lenT]; decide +kernel
theorem okM227 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 1 = true := okB2322
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 2 = true := blkChk_join _ _ _ _ _ 2322 1 1 h0 okB2323
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 3 = true := blkChk_join _ _ _ _ _ 2322 2 1 h1 okB2324
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 4 = true := blkChk_join _ _ _ _ _ 2322 3 1 h2 okB2325
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 5 = true := blkChk_join _ _ _ _ _ 2322 4 1 h3 okB2326
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 6 = true := blkChk_join _ _ _ _ _ 2322 5 1 h4 okB2327
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 7 = true := blkChk_join _ _ _ _ _ 2322 6 1 h5 okB2328
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 8 = true := blkChk_join _ _ _ _ _ 2322 7 1 h6 okB2329
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2322 9 = true := blkChk_join _ _ _ _ _ 2322 8 1 h7 okB2330
  exact h8
end E1.C236X
