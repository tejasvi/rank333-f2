module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2359 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2359 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2360 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2360 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2361 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2361 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2362 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2362 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2363 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2363 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG258 : glueChkR lits W 2359 5 = true := by
  rw [← glueChkRN_eq lits W 7747 2359 lenT]; decide +kernel
theorem okM258 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2359 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2359 1 = true := okB2359
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2359 2 = true := blkChk_join _ _ _ _ _ 2359 1 1 h0 okB2360
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2359 3 = true := blkChk_join _ _ _ _ _ 2359 2 1 h1 okB2361
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2359 4 = true := blkChk_join _ _ _ _ _ 2359 3 1 h2 okB2362
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2359 5 = true := blkChk_join _ _ _ _ _ 2359 4 1 h3 okB2363
  exact h4
end E1.C284X
