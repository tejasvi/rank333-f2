module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4890 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4890 1 = true := by decide +kernel
theorem okB4891 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4891 1 = true := by decide +kernel
theorem okB4892 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4892 1 = true := by decide +kernel
theorem okB4893 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4893 1 = true := by decide +kernel
theorem okB4894 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4894 1 = true := by decide +kernel
theorem okB4895 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4895 1 = true := by decide +kernel
theorem okB4896 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4896 1 = true := by decide +kernel
theorem okB4897 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4897 1 = true := by decide +kernel
theorem okG469 : glueChkR lits W 4890 8 = true := by decide +kernel
theorem okM469 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4890 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4890 1 = true := okB4890
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4890 2 = true := blkChk_join _ _ _ _ _ 4890 1 1 h0 okB4891
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4890 3 = true := blkChk_join _ _ _ _ _ 4890 2 1 h1 okB4892
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4890 4 = true := blkChk_join _ _ _ _ _ 4890 3 1 h2 okB4893
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4890 5 = true := blkChk_join _ _ _ _ _ 4890 4 1 h3 okB4894
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4890 6 = true := blkChk_join _ _ _ _ _ 4890 5 1 h4 okB4895
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4890 7 = true := blkChk_join _ _ _ _ _ 4890 6 1 h5 okB4896
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4890 8 = true := blkChk_join _ _ _ _ _ 4890 7 1 h6 okB4897
  exact h7
end E1.C384X
