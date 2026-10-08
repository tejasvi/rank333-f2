module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6974 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 1 = true := by decide +kernel
theorem okB6975 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6975 1 = true := by decide +kernel
theorem okB6976 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6976 1 = true := by decide +kernel
theorem okB6977 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6977 1 = true := by decide +kernel
theorem okB6978 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6978 1 = true := by decide +kernel
theorem okB6979 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6979 1 = true := by decide +kernel
theorem okB6980 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6980 1 = true := by decide +kernel
theorem okB6981 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6981 1 = true := by decide +kernel
theorem okB6982 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6982 1 = true := by decide +kernel
theorem okB6983 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6983 1 = true := by decide +kernel
theorem okG682 : glueChkR lits W 6974 10 = true := by decide +kernel
theorem okM682 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 1 = true := okB6974
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 2 = true := blkChk_join _ _ _ _ _ 6974 1 1 h0 okB6975
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 3 = true := blkChk_join _ _ _ _ _ 6974 2 1 h1 okB6976
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 4 = true := blkChk_join _ _ _ _ _ 6974 3 1 h2 okB6977
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 5 = true := blkChk_join _ _ _ _ _ 6974 4 1 h3 okB6978
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 6 = true := blkChk_join _ _ _ _ _ 6974 5 1 h4 okB6979
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 7 = true := blkChk_join _ _ _ _ _ 6974 6 1 h5 okB6980
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 8 = true := blkChk_join _ _ _ _ _ 6974 7 1 h6 okB6981
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 9 = true := blkChk_join _ _ _ _ _ 6974 8 1 h7 okB6982
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6974 10 = true := blkChk_join _ _ _ _ _ 6974 9 1 h8 okB6983
  exact h9
end E1.C384X
