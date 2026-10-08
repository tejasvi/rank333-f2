module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB339 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 339 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB340 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 340 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB341 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 341 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB342 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 342 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB343 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 343 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB344 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 344 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB345 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 345 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG35 : glueChkR lits W 339 7 = true := by
  rw [← glueChkRN_eq lits W 7747 339 lenT]; decide +kernel
theorem okM35 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 339 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 339 1 = true := okB339
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 339 2 = true := blkChk_join _ _ _ _ _ 339 1 1 h0 okB340
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 339 3 = true := blkChk_join _ _ _ _ _ 339 2 1 h1 okB341
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 339 4 = true := blkChk_join _ _ _ _ _ 339 3 1 h2 okB342
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 339 5 = true := blkChk_join _ _ _ _ _ 339 4 1 h3 okB343
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 339 6 = true := blkChk_join _ _ _ _ _ 339 5 1 h4 okB344
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 339 7 = true := blkChk_join _ _ _ _ _ 339 6 1 h5 okB345
  exact h6
end E1.C284X
