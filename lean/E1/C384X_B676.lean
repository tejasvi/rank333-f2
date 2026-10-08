module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6916 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6916 1 = true := by decide +kernel
theorem okB6917 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6917 1 = true := by decide +kernel
theorem okB6918 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6918 1 = true := by decide +kernel
theorem okB6919 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6919 1 = true := by decide +kernel
theorem okB6920 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6920 1 = true := by decide +kernel
theorem okB6921 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6921 1 = true := by decide +kernel
theorem okB6922 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6922 1 = true := by decide +kernel
theorem okB6923 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6923 1 = true := by decide +kernel
theorem okG676 : glueChkR lits W 6916 8 = true := by decide +kernel
theorem okM676 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6916 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6916 1 = true := okB6916
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6916 2 = true := blkChk_join _ _ _ _ _ 6916 1 1 h0 okB6917
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6916 3 = true := blkChk_join _ _ _ _ _ 6916 2 1 h1 okB6918
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6916 4 = true := blkChk_join _ _ _ _ _ 6916 3 1 h2 okB6919
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6916 5 = true := blkChk_join _ _ _ _ _ 6916 4 1 h3 okB6920
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6916 6 = true := blkChk_join _ _ _ _ _ 6916 5 1 h4 okB6921
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6916 7 = true := blkChk_join _ _ _ _ _ 6916 6 1 h5 okB6922
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6916 8 = true := blkChk_join _ _ _ _ _ 6916 7 1 h6 okB6923
  exact h7
end E1.C384X
