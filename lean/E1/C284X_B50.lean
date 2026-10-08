module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB440 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 440 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB441 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 441 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB442 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 442 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB443 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 443 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB444 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 444 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB445 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 445 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB446 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 446 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG50 : glueChkR lits W 440 7 = true := by
  rw [← glueChkRN_eq lits W 7747 440 lenT]; decide +kernel
theorem okM50 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 440 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 440 1 = true := okB440
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 440 2 = true := blkChk_join _ _ _ _ _ 440 1 1 h0 okB441
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 440 3 = true := blkChk_join _ _ _ _ _ 440 2 1 h1 okB442
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 440 4 = true := blkChk_join _ _ _ _ _ 440 3 1 h2 okB443
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 440 5 = true := blkChk_join _ _ _ _ _ 440 4 1 h3 okB444
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 440 6 = true := blkChk_join _ _ _ _ _ 440 5 1 h4 okB445
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 440 7 = true := blkChk_join _ _ _ _ _ 440 6 1 h5 okB446
  exact h6
end E1.C284X
