module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4082 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 1 = true := by decide +kernel
theorem okB4083 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4083 1 = true := by decide +kernel
theorem okB4084 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4084 1 = true := by decide +kernel
theorem okB4085 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4085 1 = true := by decide +kernel
theorem okB4086 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4086 1 = true := by decide +kernel
theorem okB4087 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4087 1 = true := by decide +kernel
theorem okB4088 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4088 1 = true := by decide +kernel
theorem okB4089 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4089 1 = true := by decide +kernel
theorem okB4090 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4090 1 = true := by decide +kernel
theorem okB4091 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4091 1 = true := by decide +kernel
theorem okG391 : glueChkR lits W 4082 10 = true := by decide +kernel
theorem okM391 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 1 = true := okB4082
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 2 = true := blkChk_join _ _ _ _ _ 4082 1 1 h0 okB4083
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 3 = true := blkChk_join _ _ _ _ _ 4082 2 1 h1 okB4084
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 4 = true := blkChk_join _ _ _ _ _ 4082 3 1 h2 okB4085
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 5 = true := blkChk_join _ _ _ _ _ 4082 4 1 h3 okB4086
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 6 = true := blkChk_join _ _ _ _ _ 4082 5 1 h4 okB4087
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 7 = true := blkChk_join _ _ _ _ _ 4082 6 1 h5 okB4088
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 8 = true := blkChk_join _ _ _ _ _ 4082 7 1 h6 okB4089
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 9 = true := blkChk_join _ _ _ _ _ 4082 8 1 h7 okB4090
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4082 10 = true := blkChk_join _ _ _ _ _ 4082 9 1 h8 okB4091
  exact h9
end E1.C384X
