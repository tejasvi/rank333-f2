module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB1023 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 1 = true := by decide +kernel
theorem okB1024 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1024 1 = true := by decide +kernel
theorem okB1025 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1025 1 = true := by decide +kernel
theorem okB1026 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1026 1 = true := by decide +kernel
theorem okB1027 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1027 1 = true := by decide +kernel
theorem okB1028 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1028 1 = true := by decide +kernel
theorem okB1029 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1029 1 = true := by decide +kernel
theorem okB1030 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1030 1 = true := by decide +kernel
theorem okB1031 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1031 1 = true := by decide +kernel
theorem okG94 : glueChkR lits W 1023 9 = true := by decide +kernel
theorem okM94 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 9 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 1 = true := okB1023
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 2 = true := blkChk_join _ _ _ _ _ 1023 1 1 h0 okB1024
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 3 = true := blkChk_join _ _ _ _ _ 1023 2 1 h1 okB1025
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 4 = true := blkChk_join _ _ _ _ _ 1023 3 1 h2 okB1026
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 5 = true := blkChk_join _ _ _ _ _ 1023 4 1 h3 okB1027
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 6 = true := blkChk_join _ _ _ _ _ 1023 5 1 h4 okB1028
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 7 = true := blkChk_join _ _ _ _ _ 1023 6 1 h5 okB1029
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 8 = true := blkChk_join _ _ _ _ _ 1023 7 1 h6 okB1030
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1023 9 = true := blkChk_join _ _ _ _ _ 1023 8 1 h7 okB1031
  exact h8
end E1.C387X
