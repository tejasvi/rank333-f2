module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7497 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7498 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7498 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7499 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7499 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7500 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7500 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7501 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7501 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7502 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7502 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7503 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7503 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7504 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7504 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7505 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7505 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7506 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7506 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG756 : glueChkR lits W 7497 10 = true := by
  rw [← glueChkRN_eq lits W 7747 7497 lenT]; decide +kernel
theorem okM756 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 1 = true := okB7497
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 2 = true := blkChk_join _ _ _ _ _ 7497 1 1 h0 okB7498
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 3 = true := blkChk_join _ _ _ _ _ 7497 2 1 h1 okB7499
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 4 = true := blkChk_join _ _ _ _ _ 7497 3 1 h2 okB7500
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 5 = true := blkChk_join _ _ _ _ _ 7497 4 1 h3 okB7501
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 6 = true := blkChk_join _ _ _ _ _ 7497 5 1 h4 okB7502
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 7 = true := blkChk_join _ _ _ _ _ 7497 6 1 h5 okB7503
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 8 = true := blkChk_join _ _ _ _ _ 7497 7 1 h6 okB7504
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 9 = true := blkChk_join _ _ _ _ _ 7497 8 1 h7 okB7505
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7497 10 = true := blkChk_join _ _ _ _ _ 7497 9 1 h8 okB7506
  exact h9
end E1.C284X
