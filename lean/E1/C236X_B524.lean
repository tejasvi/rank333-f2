module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5373 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5373 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5374 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5374 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5375 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5375 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5376 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5376 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5377 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5377 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5378 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5378 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5379 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5379 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5380 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5380 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG524 : glueChkR lits W 5373 8 = true := by
  rw [← glueChkRN_eq lits W 8596 5373 lenT]; decide +kernel
theorem okM524 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5373 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5373 1 = true := okB5373
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5373 2 = true := blkChk_join _ _ _ _ _ 5373 1 1 h0 okB5374
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5373 3 = true := blkChk_join _ _ _ _ _ 5373 2 1 h1 okB5375
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5373 4 = true := blkChk_join _ _ _ _ _ 5373 3 1 h2 okB5376
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5373 5 = true := blkChk_join _ _ _ _ _ 5373 4 1 h3 okB5377
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5373 6 = true := blkChk_join _ _ _ _ _ 5373 5 1 h4 okB5378
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5373 7 = true := blkChk_join _ _ _ _ _ 5373 6 1 h5 okB5379
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5373 8 = true := blkChk_join _ _ _ _ _ 5373 7 1 h6 okB5380
  exact h7
end E1.C236X
