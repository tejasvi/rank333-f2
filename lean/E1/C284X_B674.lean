module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6471 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6471 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6472 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6472 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6473 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6473 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6474 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6474 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6475 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6475 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6476 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6476 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6477 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6477 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6478 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6478 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG674 : glueChkR lits W 6471 8 = true := by
  rw [← glueChkRN_eq lits W 7747 6471 lenT]; decide +kernel
theorem okM674 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6471 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6471 1 = true := okB6471
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6471 2 = true := blkChk_join _ _ _ _ _ 6471 1 1 h0 okB6472
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6471 3 = true := blkChk_join _ _ _ _ _ 6471 2 1 h1 okB6473
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6471 4 = true := blkChk_join _ _ _ _ _ 6471 3 1 h2 okB6474
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6471 5 = true := blkChk_join _ _ _ _ _ 6471 4 1 h3 okB6475
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6471 6 = true := blkChk_join _ _ _ _ _ 6471 5 1 h4 okB6476
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6471 7 = true := blkChk_join _ _ _ _ _ 6471 6 1 h5 okB6477
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6471 8 = true := blkChk_join _ _ _ _ _ 6471 7 1 h6 okB6478
  exact h7
end E1.C284X
