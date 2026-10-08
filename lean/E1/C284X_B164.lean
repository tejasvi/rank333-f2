module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1503 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1503 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1504 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1504 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1505 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1505 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1506 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1506 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1507 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1507 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG164 : glueChkR lits W 1503 5 = true := by
  rw [← glueChkRN_eq lits W 7747 1503 lenT]; decide +kernel
theorem okM164 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1503 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1503 1 = true := okB1503
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1503 2 = true := blkChk_join _ _ _ _ _ 1503 1 1 h0 okB1504
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1503 3 = true := blkChk_join _ _ _ _ _ 1503 2 1 h1 okB1505
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1503 4 = true := blkChk_join _ _ _ _ _ 1503 3 1 h2 okB1506
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1503 5 = true := blkChk_join _ _ _ _ _ 1503 4 1 h3 okB1507
  exact h4
end E1.C284X
