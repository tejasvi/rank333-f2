module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4380 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4380 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4381 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4381 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4382 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4382 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4383 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4383 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4384 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4384 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4385 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4385 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG430 : glueChkR lits W 4380 6 = true := by
  rw [← glueChkRN_eq lits W 8596 4380 lenT]; decide +kernel
theorem okM430 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4380 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4380 1 = true := okB4380
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4380 2 = true := blkChk_join _ _ _ _ _ 4380 1 1 h0 okB4381
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4380 3 = true := blkChk_join _ _ _ _ _ 4380 2 1 h1 okB4382
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4380 4 = true := blkChk_join _ _ _ _ _ 4380 3 1 h2 okB4383
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4380 5 = true := blkChk_join _ _ _ _ _ 4380 4 1 h3 okB4384
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4380 6 = true := blkChk_join _ _ _ _ _ 4380 5 1 h4 okB4385
  exact h5
end E1.C236X
