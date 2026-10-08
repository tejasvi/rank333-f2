module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB7470 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7471 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7471 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7472 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7472 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7473 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7473 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7474 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7474 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7475 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7475 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7476 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7476 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7477 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7477 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7478 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7478 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7479 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7479 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG703 : glueChkR lits W 7470 10 = true := by
  rw [← glueChkRN_eq lits W 8596 7470 lenT]; decide +kernel
theorem okM703 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 1 = true := okB7470
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 2 = true := blkChk_join _ _ _ _ _ 7470 1 1 h0 okB7471
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 3 = true := blkChk_join _ _ _ _ _ 7470 2 1 h1 okB7472
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 4 = true := blkChk_join _ _ _ _ _ 7470 3 1 h2 okB7473
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 5 = true := blkChk_join _ _ _ _ _ 7470 4 1 h3 okB7474
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 6 = true := blkChk_join _ _ _ _ _ 7470 5 1 h4 okB7475
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 7 = true := blkChk_join _ _ _ _ _ 7470 6 1 h5 okB7476
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 8 = true := blkChk_join _ _ _ _ _ 7470 7 1 h6 okB7477
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 9 = true := blkChk_join _ _ _ _ _ 7470 8 1 h7 okB7478
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7470 10 = true := blkChk_join _ _ _ _ _ 7470 9 1 h8 okB7479
  exact h9
end E1.C236X
