module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2611 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2611 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2612 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2612 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2613 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2613 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2614 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2614 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2615 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2615 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2616 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2616 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2617 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2617 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG283 : glueChkR lits W 2611 7 = true := by
  rw [← glueChkRN_eq lits W 7747 2611 lenT]; decide +kernel
theorem okM283 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2611 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2611 1 = true := okB2611
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2611 2 = true := blkChk_join _ _ _ _ _ 2611 1 1 h0 okB2612
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2611 3 = true := blkChk_join _ _ _ _ _ 2611 2 1 h1 okB2613
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2611 4 = true := blkChk_join _ _ _ _ _ 2611 3 1 h2 okB2614
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2611 5 = true := blkChk_join _ _ _ _ _ 2611 4 1 h3 okB2615
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2611 6 = true := blkChk_join _ _ _ _ _ 2611 5 1 h4 okB2616
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2611 7 = true := blkChk_join _ _ _ _ _ 2611 6 1 h5 okB2617
  exact h6
end E1.C284X
