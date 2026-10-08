module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB1053 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 1 = true := by decide +kernel
theorem okB1054 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1054 1 = true := by decide +kernel
theorem okB1055 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1055 1 = true := by decide +kernel
theorem okB1056 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1056 1 = true := by decide +kernel
theorem okB1057 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1057 1 = true := by decide +kernel
theorem okB1058 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1058 1 = true := by decide +kernel
theorem okB1059 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1059 1 = true := by decide +kernel
theorem okB1060 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1060 1 = true := by decide +kernel
theorem okB1061 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1061 1 = true := by decide +kernel
theorem okG97 : glueChkR lits W 1053 9 = true := by decide +kernel
theorem okM97 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 9 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 1 = true := okB1053
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 2 = true := blkChk_join _ _ _ _ _ 1053 1 1 h0 okB1054
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 3 = true := blkChk_join _ _ _ _ _ 1053 2 1 h1 okB1055
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 4 = true := blkChk_join _ _ _ _ _ 1053 3 1 h2 okB1056
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 5 = true := blkChk_join _ _ _ _ _ 1053 4 1 h3 okB1057
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 6 = true := blkChk_join _ _ _ _ _ 1053 5 1 h4 okB1058
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 7 = true := blkChk_join _ _ _ _ _ 1053 6 1 h5 okB1059
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 8 = true := blkChk_join _ _ _ _ _ 1053 7 1 h6 okB1060
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 1053 9 = true := blkChk_join _ _ _ _ _ 1053 8 1 h7 okB1061
  exact h8
end E1.C387X
