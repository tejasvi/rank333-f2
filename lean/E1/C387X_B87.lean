module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB941 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 1 = true := by decide +kernel
theorem okB942 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 942 1 = true := by decide +kernel
theorem okB943 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 943 1 = true := by decide +kernel
theorem okB944 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 944 1 = true := by decide +kernel
theorem okB945 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 945 1 = true := by decide +kernel
theorem okB946 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 946 1 = true := by decide +kernel
theorem okB947 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 947 1 = true := by decide +kernel
theorem okB948 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 948 1 = true := by decide +kernel
theorem okB949 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 949 1 = true := by decide +kernel
theorem okB950 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 950 1 = true := by decide +kernel
theorem okB951 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 951 1 = true := by decide +kernel
theorem okG87 : glueChkR lits W 941 11 = true := by decide +kernel
theorem okM87 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 11 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 1 = true := okB941
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 2 = true := blkChk_join _ _ _ _ _ 941 1 1 h0 okB942
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 3 = true := blkChk_join _ _ _ _ _ 941 2 1 h1 okB943
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 4 = true := blkChk_join _ _ _ _ _ 941 3 1 h2 okB944
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 5 = true := blkChk_join _ _ _ _ _ 941 4 1 h3 okB945
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 6 = true := blkChk_join _ _ _ _ _ 941 5 1 h4 okB946
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 7 = true := blkChk_join _ _ _ _ _ 941 6 1 h5 okB947
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 8 = true := blkChk_join _ _ _ _ _ 941 7 1 h6 okB948
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 9 = true := blkChk_join _ _ _ _ _ 941 8 1 h7 okB949
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 10 = true := blkChk_join _ _ _ _ _ 941 9 1 h8 okB950
  have h10 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 941 11 = true := blkChk_join _ _ _ _ _ 941 10 1 h9 okB951
  exact h10
end E1.C387X
