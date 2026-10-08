module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5916 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 1 = true := by decide +kernel
theorem okB5917 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5917 1 = true := by decide +kernel
theorem okB5918 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5918 1 = true := by decide +kernel
theorem okB5919 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5919 1 = true := by decide +kernel
theorem okB5920 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5920 1 = true := by decide +kernel
theorem okB5921 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5921 1 = true := by decide +kernel
theorem okB5922 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5922 1 = true := by decide +kernel
theorem okB5923 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5923 1 = true := by decide +kernel
theorem okB5924 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5924 1 = true := by decide +kernel
theorem okG570 : glueChkR lits W 5916 9 = true := by decide +kernel
theorem okM570 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 1 = true := okB5916
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 2 = true := blkChk_join _ _ _ _ _ 5916 1 1 h0 okB5917
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 3 = true := blkChk_join _ _ _ _ _ 5916 2 1 h1 okB5918
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 4 = true := blkChk_join _ _ _ _ _ 5916 3 1 h2 okB5919
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 5 = true := blkChk_join _ _ _ _ _ 5916 4 1 h3 okB5920
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 6 = true := blkChk_join _ _ _ _ _ 5916 5 1 h4 okB5921
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 7 = true := blkChk_join _ _ _ _ _ 5916 6 1 h5 okB5922
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 8 = true := blkChk_join _ _ _ _ _ 5916 7 1 h6 okB5923
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5916 9 = true := blkChk_join _ _ _ _ _ 5916 8 1 h7 okB5924
  exact h8
end E1.C384X
