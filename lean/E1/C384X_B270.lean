module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2858 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2858 1 = true := by decide +kernel
theorem okB2859 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2859 1 = true := by decide +kernel
theorem okB2860 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2860 1 = true := by decide +kernel
theorem okB2861 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2861 1 = true := by decide +kernel
theorem okB2862 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2862 1 = true := by decide +kernel
theorem okB2863 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2863 1 = true := by decide +kernel
theorem okB2864 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2864 1 = true := by decide +kernel
theorem okB2865 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2865 1 = true := by decide +kernel
theorem okG270 : glueChkR lits W 2858 8 = true := by decide +kernel
theorem okM270 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2858 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2858 1 = true := okB2858
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2858 2 = true := blkChk_join _ _ _ _ _ 2858 1 1 h0 okB2859
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2858 3 = true := blkChk_join _ _ _ _ _ 2858 2 1 h1 okB2860
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2858 4 = true := blkChk_join _ _ _ _ _ 2858 3 1 h2 okB2861
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2858 5 = true := blkChk_join _ _ _ _ _ 2858 4 1 h3 okB2862
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2858 6 = true := blkChk_join _ _ _ _ _ 2858 5 1 h4 okB2863
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2858 7 = true := blkChk_join _ _ _ _ _ 2858 6 1 h5 okB2864
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2858 8 = true := blkChk_join _ _ _ _ _ 2858 7 1 h6 okB2865
  exact h7
end E1.C384X
