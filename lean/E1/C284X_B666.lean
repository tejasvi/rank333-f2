module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6397 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6397 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6398 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6398 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6399 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6399 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6400 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6400 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6401 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6401 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6402 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6402 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG666 : glueChkR lits W 6397 6 = true := by
  rw [← glueChkRN_eq lits W 7747 6397 lenT]; decide +kernel
theorem okM666 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6397 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6397 1 = true := okB6397
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6397 2 = true := blkChk_join _ _ _ _ _ 6397 1 1 h0 okB6398
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6397 3 = true := blkChk_join _ _ _ _ _ 6397 2 1 h1 okB6399
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6397 4 = true := blkChk_join _ _ _ _ _ 6397 3 1 h2 okB6400
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6397 5 = true := blkChk_join _ _ _ _ _ 6397 4 1 h3 okB6401
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6397 6 = true := blkChk_join _ _ _ _ _ 6397 5 1 h4 okB6402
  exact h5
end E1.C284X
