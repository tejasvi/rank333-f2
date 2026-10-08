module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB369 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB370 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 370 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB371 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 371 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB372 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 372 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB373 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 373 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB374 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 374 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB375 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 375 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB376 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 376 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB377 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 377 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB378 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 378 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG35 : glueChkR lits W 369 10 = true := by
  rw [← glueChkRN_eq lits W 8596 369 lenT]; decide +kernel
theorem okM35 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 1 = true := okB369
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 2 = true := blkChk_join _ _ _ _ _ 369 1 1 h0 okB370
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 3 = true := blkChk_join _ _ _ _ _ 369 2 1 h1 okB371
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 4 = true := blkChk_join _ _ _ _ _ 369 3 1 h2 okB372
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 5 = true := blkChk_join _ _ _ _ _ 369 4 1 h3 okB373
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 6 = true := blkChk_join _ _ _ _ _ 369 5 1 h4 okB374
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 7 = true := blkChk_join _ _ _ _ _ 369 6 1 h5 okB375
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 8 = true := blkChk_join _ _ _ _ _ 369 7 1 h6 okB376
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 9 = true := blkChk_join _ _ _ _ _ 369 8 1 h7 okB377
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 369 10 = true := blkChk_join _ _ _ _ _ 369 9 1 h8 okB378
  exact h9
end E1.C236X
