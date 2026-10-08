module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2811 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2812 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2812 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2813 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2813 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2814 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2814 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2815 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2815 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2816 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2816 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2817 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2817 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2818 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2818 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2819 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2819 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2820 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2820 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG306 : glueChkR lits W 2811 10 = true := by
  rw [← glueChkRN_eq lits W 7747 2811 lenT]; decide +kernel
theorem okM306 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 1 = true := okB2811
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 2 = true := blkChk_join _ _ _ _ _ 2811 1 1 h0 okB2812
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 3 = true := blkChk_join _ _ _ _ _ 2811 2 1 h1 okB2813
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 4 = true := blkChk_join _ _ _ _ _ 2811 3 1 h2 okB2814
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 5 = true := blkChk_join _ _ _ _ _ 2811 4 1 h3 okB2815
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 6 = true := blkChk_join _ _ _ _ _ 2811 5 1 h4 okB2816
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 7 = true := blkChk_join _ _ _ _ _ 2811 6 1 h5 okB2817
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 8 = true := blkChk_join _ _ _ _ _ 2811 7 1 h6 okB2818
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 9 = true := blkChk_join _ _ _ _ _ 2811 8 1 h7 okB2819
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2811 10 = true := blkChk_join _ _ _ _ _ 2811 9 1 h8 okB2820
  exact h9
end E1.C284X
