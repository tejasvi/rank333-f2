module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2801 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 1 = true := by decide +kernel
theorem okB2802 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2802 1 = true := by decide +kernel
theorem okB2803 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2803 1 = true := by decide +kernel
theorem okB2804 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2804 1 = true := by decide +kernel
theorem okB2805 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2805 1 = true := by decide +kernel
theorem okB2806 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2806 1 = true := by decide +kernel
theorem okB2807 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2807 1 = true := by decide +kernel
theorem okB2808 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2808 1 = true := by decide +kernel
theorem okB2809 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2809 1 = true := by decide +kernel
theorem okB2810 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2810 1 = true := by decide +kernel
theorem okB2811 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2811 1 = true := by decide +kernel
theorem okB2812 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2812 1 = true := by decide +kernel
theorem okB2813 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2813 1 = true := by decide +kernel
theorem okG264 : glueChkR lits W 2801 13 = true := by decide +kernel
theorem okM264 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 13 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 1 = true := okB2801
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 2 = true := blkChk_join _ _ _ _ _ 2801 1 1 h0 okB2802
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 3 = true := blkChk_join _ _ _ _ _ 2801 2 1 h1 okB2803
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 4 = true := blkChk_join _ _ _ _ _ 2801 3 1 h2 okB2804
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 5 = true := blkChk_join _ _ _ _ _ 2801 4 1 h3 okB2805
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 6 = true := blkChk_join _ _ _ _ _ 2801 5 1 h4 okB2806
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 7 = true := blkChk_join _ _ _ _ _ 2801 6 1 h5 okB2807
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 8 = true := blkChk_join _ _ _ _ _ 2801 7 1 h6 okB2808
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 9 = true := blkChk_join _ _ _ _ _ 2801 8 1 h7 okB2809
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 10 = true := blkChk_join _ _ _ _ _ 2801 9 1 h8 okB2810
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 11 = true := blkChk_join _ _ _ _ _ 2801 10 1 h9 okB2811
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 12 = true := blkChk_join _ _ _ _ _ 2801 11 1 h10 okB2812
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2801 13 = true := blkChk_join _ _ _ _ _ 2801 12 1 h11 okB2813
  exact h12
end E1.C384X
