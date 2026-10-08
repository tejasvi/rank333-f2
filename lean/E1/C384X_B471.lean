module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4906 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 1 = true := by decide +kernel
theorem okB4907 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4907 1 = true := by decide +kernel
theorem okB4908 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4908 1 = true := by decide +kernel
theorem okB4909 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4909 1 = true := by decide +kernel
theorem okB4910 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4910 1 = true := by decide +kernel
theorem okB4911 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4911 1 = true := by decide +kernel
theorem okB4912 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4912 1 = true := by decide +kernel
theorem okB4913 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4913 1 = true := by decide +kernel
theorem okB4914 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4914 1 = true := by decide +kernel
theorem okB4915 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4915 1 = true := by decide +kernel
theorem okB4916 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4916 1 = true := by decide +kernel
theorem okG471 : glueChkR lits W 4906 11 = true := by decide +kernel
theorem okM471 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 1 = true := okB4906
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 2 = true := blkChk_join _ _ _ _ _ 4906 1 1 h0 okB4907
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 3 = true := blkChk_join _ _ _ _ _ 4906 2 1 h1 okB4908
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 4 = true := blkChk_join _ _ _ _ _ 4906 3 1 h2 okB4909
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 5 = true := blkChk_join _ _ _ _ _ 4906 4 1 h3 okB4910
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 6 = true := blkChk_join _ _ _ _ _ 4906 5 1 h4 okB4911
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 7 = true := blkChk_join _ _ _ _ _ 4906 6 1 h5 okB4912
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 8 = true := blkChk_join _ _ _ _ _ 4906 7 1 h6 okB4913
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 9 = true := blkChk_join _ _ _ _ _ 4906 8 1 h7 okB4914
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 10 = true := blkChk_join _ _ _ _ _ 4906 9 1 h8 okB4915
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4906 11 = true := blkChk_join _ _ _ _ _ 4906 10 1 h9 okB4916
  exact h10
end E1.C384X
