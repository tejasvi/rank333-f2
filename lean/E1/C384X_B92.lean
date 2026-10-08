module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB965 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 1 = true := by decide +kernel
theorem okB966 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 966 1 = true := by decide +kernel
theorem okB967 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 967 1 = true := by decide +kernel
theorem okB968 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 968 1 = true := by decide +kernel
theorem okB969 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 969 1 = true := by decide +kernel
theorem okB970 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 970 1 = true := by decide +kernel
theorem okB971 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 971 1 = true := by decide +kernel
theorem okB972 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 972 1 = true := by decide +kernel
theorem okB973 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 973 1 = true := by decide +kernel
theorem okG92 : glueChkR lits W 965 9 = true := by decide +kernel
theorem okM92 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 1 = true := okB965
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 2 = true := blkChk_join _ _ _ _ _ 965 1 1 h0 okB966
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 3 = true := blkChk_join _ _ _ _ _ 965 2 1 h1 okB967
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 4 = true := blkChk_join _ _ _ _ _ 965 3 1 h2 okB968
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 5 = true := blkChk_join _ _ _ _ _ 965 4 1 h3 okB969
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 6 = true := blkChk_join _ _ _ _ _ 965 5 1 h4 okB970
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 7 = true := blkChk_join _ _ _ _ _ 965 6 1 h5 okB971
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 8 = true := blkChk_join _ _ _ _ _ 965 7 1 h6 okB972
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 965 9 = true := blkChk_join _ _ _ _ _ 965 8 1 h7 okB973
  exact h8
end E1.C384X
