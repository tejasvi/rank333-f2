module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4071 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 1 = true := by decide +kernel
theorem okB4072 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4072 1 = true := by decide +kernel
theorem okB4073 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4073 1 = true := by decide +kernel
theorem okB4074 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4074 1 = true := by decide +kernel
theorem okB4075 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4075 1 = true := by decide +kernel
theorem okB4076 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4076 1 = true := by decide +kernel
theorem okB4077 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4077 1 = true := by decide +kernel
theorem okB4078 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4078 1 = true := by decide +kernel
theorem okB4079 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4079 1 = true := by decide +kernel
theorem okB4080 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4080 1 = true := by decide +kernel
theorem okB4081 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4081 1 = true := by decide +kernel
theorem okG390 : glueChkR lits W 4071 11 = true := by decide +kernel
theorem okM390 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 1 = true := okB4071
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 2 = true := blkChk_join _ _ _ _ _ 4071 1 1 h0 okB4072
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 3 = true := blkChk_join _ _ _ _ _ 4071 2 1 h1 okB4073
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 4 = true := blkChk_join _ _ _ _ _ 4071 3 1 h2 okB4074
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 5 = true := blkChk_join _ _ _ _ _ 4071 4 1 h3 okB4075
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 6 = true := blkChk_join _ _ _ _ _ 4071 5 1 h4 okB4076
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 7 = true := blkChk_join _ _ _ _ _ 4071 6 1 h5 okB4077
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 8 = true := blkChk_join _ _ _ _ _ 4071 7 1 h6 okB4078
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 9 = true := blkChk_join _ _ _ _ _ 4071 8 1 h7 okB4079
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 10 = true := blkChk_join _ _ _ _ _ 4071 9 1 h8 okB4080
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4071 11 = true := blkChk_join _ _ _ _ _ 4071 10 1 h9 okB4081
  exact h10
end E1.C384X
