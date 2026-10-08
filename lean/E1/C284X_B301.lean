module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2767 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2767 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2768 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2768 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2769 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2769 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2770 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2770 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2771 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2771 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2772 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2772 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2773 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2773 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2774 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2774 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG301 : glueChkR lits W 2767 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2767 lenT]; decide +kernel
theorem okM301 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2767 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2767 1 = true := okB2767
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2767 2 = true := blkChk_join _ _ _ _ _ 2767 1 1 h0 okB2768
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2767 3 = true := blkChk_join _ _ _ _ _ 2767 2 1 h1 okB2769
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2767 4 = true := blkChk_join _ _ _ _ _ 2767 3 1 h2 okB2770
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2767 5 = true := blkChk_join _ _ _ _ _ 2767 4 1 h3 okB2771
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2767 6 = true := blkChk_join _ _ _ _ _ 2767 5 1 h4 okB2772
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2767 7 = true := blkChk_join _ _ _ _ _ 2767 6 1 h5 okB2773
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2767 8 = true := blkChk_join _ _ _ _ _ 2767 7 1 h6 okB2774
  exact h7
end E1.C284X
