module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5391 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5392 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5392 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5393 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5393 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5394 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5394 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5395 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5395 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5396 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5396 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5397 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5397 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5398 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5398 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5399 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5399 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5400 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5400 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG526 : glueChkR lits W 5391 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5391 lenT]; decide +kernel
theorem okM526 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 1 = true := okB5391
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 2 = true := blkChk_join _ _ _ _ _ 5391 1 1 h0 okB5392
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 3 = true := blkChk_join _ _ _ _ _ 5391 2 1 h1 okB5393
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 4 = true := blkChk_join _ _ _ _ _ 5391 3 1 h2 okB5394
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 5 = true := blkChk_join _ _ _ _ _ 5391 4 1 h3 okB5395
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 6 = true := blkChk_join _ _ _ _ _ 5391 5 1 h4 okB5396
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 7 = true := blkChk_join _ _ _ _ _ 5391 6 1 h5 okB5397
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 8 = true := blkChk_join _ _ _ _ _ 5391 7 1 h6 okB5398
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 9 = true := blkChk_join _ _ _ _ _ 5391 8 1 h7 okB5399
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5391 10 = true := blkChk_join _ _ _ _ _ 5391 9 1 h8 okB5400
  exact h9
end E1.C236X
