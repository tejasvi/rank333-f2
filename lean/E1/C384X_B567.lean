module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5881 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 1 = true := by decide +kernel
theorem okB5882 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5882 1 = true := by decide +kernel
theorem okB5883 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5883 1 = true := by decide +kernel
theorem okB5884 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5884 1 = true := by decide +kernel
theorem okB5885 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5885 1 = true := by decide +kernel
theorem okB5886 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5886 1 = true := by decide +kernel
theorem okB5887 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5887 1 = true := by decide +kernel
theorem okB5888 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5888 1 = true := by decide +kernel
theorem okB5889 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5889 1 = true := by decide +kernel
theorem okG567 : glueChkR lits W 5881 9 = true := by decide +kernel
theorem okM567 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 1 = true := okB5881
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 2 = true := blkChk_join _ _ _ _ _ 5881 1 1 h0 okB5882
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 3 = true := blkChk_join _ _ _ _ _ 5881 2 1 h1 okB5883
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 4 = true := blkChk_join _ _ _ _ _ 5881 3 1 h2 okB5884
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 5 = true := blkChk_join _ _ _ _ _ 5881 4 1 h3 okB5885
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 6 = true := blkChk_join _ _ _ _ _ 5881 5 1 h4 okB5886
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 7 = true := blkChk_join _ _ _ _ _ 5881 6 1 h5 okB5887
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 8 = true := blkChk_join _ _ _ _ _ 5881 7 1 h6 okB5888
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5881 9 = true := blkChk_join _ _ _ _ _ 5881 8 1 h7 okB5889
  exact h8
end E1.C384X
