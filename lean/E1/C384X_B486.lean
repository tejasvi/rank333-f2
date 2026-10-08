module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5080 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 1 = true := by decide +kernel
theorem okB5081 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5081 1 = true := by decide +kernel
theorem okB5082 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5082 1 = true := by decide +kernel
theorem okB5083 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5083 1 = true := by decide +kernel
theorem okB5084 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5084 1 = true := by decide +kernel
theorem okB5085 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5085 1 = true := by decide +kernel
theorem okB5086 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5086 1 = true := by decide +kernel
theorem okB5087 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5087 1 = true := by decide +kernel
theorem okB5088 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5088 1 = true := by decide +kernel
theorem okG486 : glueChkR lits W 5080 9 = true := by decide +kernel
theorem okM486 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 1 = true := okB5080
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 2 = true := blkChk_join _ _ _ _ _ 5080 1 1 h0 okB5081
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 3 = true := blkChk_join _ _ _ _ _ 5080 2 1 h1 okB5082
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 4 = true := blkChk_join _ _ _ _ _ 5080 3 1 h2 okB5083
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 5 = true := blkChk_join _ _ _ _ _ 5080 4 1 h3 okB5084
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 6 = true := blkChk_join _ _ _ _ _ 5080 5 1 h4 okB5085
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 7 = true := blkChk_join _ _ _ _ _ 5080 6 1 h5 okB5086
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 8 = true := blkChk_join _ _ _ _ _ 5080 7 1 h6 okB5087
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5080 9 = true := blkChk_join _ _ _ _ _ 5080 8 1 h7 okB5088
  exact h8
end E1.C384X
