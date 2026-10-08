module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2890 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 1 = true := by decide +kernel
theorem okB2891 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2891 1 = true := by decide +kernel
theorem okB2892 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2892 1 = true := by decide +kernel
theorem okB2893 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2893 1 = true := by decide +kernel
theorem okB2894 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2894 1 = true := by decide +kernel
theorem okB2895 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2895 1 = true := by decide +kernel
theorem okB2896 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2896 1 = true := by decide +kernel
theorem okB2897 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2897 1 = true := by decide +kernel
theorem okB2898 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2898 1 = true := by decide +kernel
theorem okG274 : glueChkR lits W 2890 9 = true := by decide +kernel
theorem okM274 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 1 = true := okB2890
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 2 = true := blkChk_join _ _ _ _ _ 2890 1 1 h0 okB2891
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 3 = true := blkChk_join _ _ _ _ _ 2890 2 1 h1 okB2892
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 4 = true := blkChk_join _ _ _ _ _ 2890 3 1 h2 okB2893
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 5 = true := blkChk_join _ _ _ _ _ 2890 4 1 h3 okB2894
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 6 = true := blkChk_join _ _ _ _ _ 2890 5 1 h4 okB2895
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 7 = true := blkChk_join _ _ _ _ _ 2890 6 1 h5 okB2896
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 8 = true := blkChk_join _ _ _ _ _ 2890 7 1 h6 okB2897
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2890 9 = true := blkChk_join _ _ _ _ _ 2890 8 1 h7 okB2898
  exact h8
end E1.C384X
