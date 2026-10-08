module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2810 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2811 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2812 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2812 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2813 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2813 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2814 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2814 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2815 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2815 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2816 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2816 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2817 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2817 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2818 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2818 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2819 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2819 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG276 : glueChkR lits W 2810 10 = true := by
  rw [← glueChkRN_eq lits W 8596 2810 lenT]; decide +kernel
theorem okM276 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 1 = true := okB2810
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 2 = true := blkChk_join _ _ _ _ _ 2810 1 1 h0 okB2811
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 3 = true := blkChk_join _ _ _ _ _ 2810 2 1 h1 okB2812
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 4 = true := blkChk_join _ _ _ _ _ 2810 3 1 h2 okB2813
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 5 = true := blkChk_join _ _ _ _ _ 2810 4 1 h3 okB2814
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 6 = true := blkChk_join _ _ _ _ _ 2810 5 1 h4 okB2815
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 7 = true := blkChk_join _ _ _ _ _ 2810 6 1 h5 okB2816
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 8 = true := blkChk_join _ _ _ _ _ 2810 7 1 h6 okB2817
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 9 = true := blkChk_join _ _ _ _ _ 2810 8 1 h7 okB2818
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2810 10 = true := blkChk_join _ _ _ _ _ 2810 9 1 h8 okB2819
  exact h9
end E1.C236X
