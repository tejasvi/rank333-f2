module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6966 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6966 1 = true := by decide +kernel
theorem okB6967 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6967 1 = true := by decide +kernel
theorem okB6968 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6968 1 = true := by decide +kernel
theorem okB6969 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6969 1 = true := by decide +kernel
theorem okB6970 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6970 1 = true := by decide +kernel
theorem okB6971 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6971 1 = true := by decide +kernel
theorem okB6972 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6972 1 = true := by decide +kernel
theorem okB6973 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6973 1 = true := by decide +kernel
theorem okG681 : glueChkR lits W 6966 8 = true := by decide +kernel
theorem okM681 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6966 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6966 1 = true := okB6966
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6966 2 = true := blkChk_join _ _ _ _ _ 6966 1 1 h0 okB6967
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6966 3 = true := blkChk_join _ _ _ _ _ 6966 2 1 h1 okB6968
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6966 4 = true := blkChk_join _ _ _ _ _ 6966 3 1 h2 okB6969
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6966 5 = true := blkChk_join _ _ _ _ _ 6966 4 1 h3 okB6970
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6966 6 = true := blkChk_join _ _ _ _ _ 6966 5 1 h4 okB6971
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6966 7 = true := blkChk_join _ _ _ _ _ 6966 6 1 h5 okB6972
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6966 8 = true := blkChk_join _ _ _ _ _ 6966 7 1 h6 okB6973
  exact h7
end E1.C384X
