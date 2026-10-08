module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1326 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1327 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1327 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1328 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1328 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1329 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1329 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1330 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1330 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1331 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1331 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1332 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1332 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1333 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1333 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1334 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1334 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1335 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1335 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG146 : glueChkR lits W 1326 10 = true := by
  rw [← glueChkRN_eq lits W 7747 1326 lenT]; decide +kernel
theorem okM146 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 1 = true := okB1326
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 2 = true := blkChk_join _ _ _ _ _ 1326 1 1 h0 okB1327
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 3 = true := blkChk_join _ _ _ _ _ 1326 2 1 h1 okB1328
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 4 = true := blkChk_join _ _ _ _ _ 1326 3 1 h2 okB1329
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 5 = true := blkChk_join _ _ _ _ _ 1326 4 1 h3 okB1330
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 6 = true := blkChk_join _ _ _ _ _ 1326 5 1 h4 okB1331
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 7 = true := blkChk_join _ _ _ _ _ 1326 6 1 h5 okB1332
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 8 = true := blkChk_join _ _ _ _ _ 1326 7 1 h6 okB1333
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 9 = true := blkChk_join _ _ _ _ _ 1326 8 1 h7 okB1334
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1326 10 = true := blkChk_join _ _ _ _ _ 1326 9 1 h8 okB1335
  exact h9
end E1.C284X
