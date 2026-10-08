module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2662 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2662 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2663 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2663 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2664 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2664 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2665 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2665 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2666 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2666 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2667 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2667 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2668 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2668 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG289 : glueChkR lits W 2662 7 = true := by
  rw [← glueChkRN_eq lits W 7747 2662 lenT]; decide +kernel
theorem okM289 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2662 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2662 1 = true := okB2662
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2662 2 = true := blkChk_join _ _ _ _ _ 2662 1 1 h0 okB2663
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2662 3 = true := blkChk_join _ _ _ _ _ 2662 2 1 h1 okB2664
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2662 4 = true := blkChk_join _ _ _ _ _ 2662 3 1 h2 okB2665
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2662 5 = true := blkChk_join _ _ _ _ _ 2662 4 1 h3 okB2666
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2662 6 = true := blkChk_join _ _ _ _ _ 2662 5 1 h4 okB2667
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2662 7 = true := blkChk_join _ _ _ _ _ 2662 6 1 h5 okB2668
  exact h6
end E1.C284X
