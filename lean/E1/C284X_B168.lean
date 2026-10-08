module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1533 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1533 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1534 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1534 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1535 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1535 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1536 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1536 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1537 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1537 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1538 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1538 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1539 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1539 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG168 : glueChkR lits W 1533 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1533 lenT]; decide +kernel
theorem okM168 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1533 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1533 1 = true := okB1533
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1533 2 = true := blkChk_join _ _ _ _ _ 1533 1 1 h0 okB1534
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1533 3 = true := blkChk_join _ _ _ _ _ 1533 2 1 h1 okB1535
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1533 4 = true := blkChk_join _ _ _ _ _ 1533 3 1 h2 okB1536
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1533 5 = true := blkChk_join _ _ _ _ _ 1533 4 1 h3 okB1537
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1533 6 = true := blkChk_join _ _ _ _ _ 1533 5 1 h4 okB1538
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1533 7 = true := blkChk_join _ _ _ _ _ 1533 6 1 h5 okB1539
  exact h6
end E1.C284X
