module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2768 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2769 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2769 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2770 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2770 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2771 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2771 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2772 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2772 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2773 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2773 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2774 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2774 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2775 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2775 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2776 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2776 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG272 : glueChkR lits W 2768 9 = true := by
  rw [← glueChkRN_eq lits W 8596 2768 lenT]; decide +kernel
theorem okM272 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 1 = true := okB2768
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 2 = true := blkChk_join _ _ _ _ _ 2768 1 1 h0 okB2769
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 3 = true := blkChk_join _ _ _ _ _ 2768 2 1 h1 okB2770
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 4 = true := blkChk_join _ _ _ _ _ 2768 3 1 h2 okB2771
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 5 = true := blkChk_join _ _ _ _ _ 2768 4 1 h3 okB2772
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 6 = true := blkChk_join _ _ _ _ _ 2768 5 1 h4 okB2773
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 7 = true := blkChk_join _ _ _ _ _ 2768 6 1 h5 okB2774
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 8 = true := blkChk_join _ _ _ _ _ 2768 7 1 h6 okB2775
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2768 9 = true := blkChk_join _ _ _ _ _ 2768 8 1 h7 okB2776
  exact h8
end E1.C236X
