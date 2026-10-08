module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5411 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5411 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5412 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5412 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5413 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5413 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5414 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5414 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5415 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5415 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5416 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5416 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG528 : glueChkR lits W 5411 6 = true := by
  rw [← glueChkRN_eq lits W 8596 5411 lenT]; decide +kernel
theorem okM528 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5411 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5411 1 = true := okB5411
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5411 2 = true := blkChk_join _ _ _ _ _ 5411 1 1 h0 okB5412
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5411 3 = true := blkChk_join _ _ _ _ _ 5411 2 1 h1 okB5413
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5411 4 = true := blkChk_join _ _ _ _ _ 5411 3 1 h2 okB5414
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5411 5 = true := blkChk_join _ _ _ _ _ 5411 4 1 h3 okB5415
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5411 6 = true := blkChk_join _ _ _ _ _ 5411 5 1 h4 okB5416
  exact h5
end E1.C236X
