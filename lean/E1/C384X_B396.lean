module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4140 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 1 = true := by decide +kernel
theorem okB4141 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4141 1 = true := by decide +kernel
theorem okB4142 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4142 1 = true := by decide +kernel
theorem okB4143 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4143 1 = true := by decide +kernel
theorem okB4144 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4144 1 = true := by decide +kernel
theorem okB4145 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4145 1 = true := by decide +kernel
theorem okB4146 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4146 1 = true := by decide +kernel
theorem okB4147 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4147 1 = true := by decide +kernel
theorem okB4148 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4148 1 = true := by decide +kernel
theorem okB4149 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4149 1 = true := by decide +kernel
theorem okB4150 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4150 1 = true := by decide +kernel
theorem okG396 : glueChkR lits W 4140 11 = true := by decide +kernel
theorem okM396 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 1 = true := okB4140
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 2 = true := blkChk_join _ _ _ _ _ 4140 1 1 h0 okB4141
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 3 = true := blkChk_join _ _ _ _ _ 4140 2 1 h1 okB4142
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 4 = true := blkChk_join _ _ _ _ _ 4140 3 1 h2 okB4143
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 5 = true := blkChk_join _ _ _ _ _ 4140 4 1 h3 okB4144
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 6 = true := blkChk_join _ _ _ _ _ 4140 5 1 h4 okB4145
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 7 = true := blkChk_join _ _ _ _ _ 4140 6 1 h5 okB4146
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 8 = true := blkChk_join _ _ _ _ _ 4140 7 1 h6 okB4147
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 9 = true := blkChk_join _ _ _ _ _ 4140 8 1 h7 okB4148
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 10 = true := blkChk_join _ _ _ _ _ 4140 9 1 h8 okB4149
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4140 11 = true := blkChk_join _ _ _ _ _ 4140 10 1 h9 okB4150
  exact h10
end E1.C384X
