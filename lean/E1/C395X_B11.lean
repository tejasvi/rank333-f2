module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C395X
open E1S
theorem okB127 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 1 = true := by decide +kernel
theorem okB128 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 128 1 = true := by decide +kernel
theorem okB129 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 129 1 = true := by decide +kernel
theorem okB130 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 130 1 = true := by decide +kernel
theorem okB131 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 131 1 = true := by decide +kernel
theorem okB132 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 132 1 = true := by decide +kernel
theorem okB133 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 133 1 = true := by decide +kernel
theorem okB134 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 134 1 = true := by decide +kernel
theorem okB135 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 135 1 = true := by decide +kernel
theorem okB136 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 136 1 = true := by decide +kernel
theorem okB137 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 137 1 = true := by decide +kernel
theorem okB138 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 138 1 = true := by decide +kernel
theorem okG11 : glueChkR lits W 127 12 = true := by decide +kernel
theorem okM11 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 12 = true := by
  have h0 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 1 = true := okB127
  have h1 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 2 = true := blkChk_join _ _ _ _ _ 127 1 1 h0 okB128
  have h2 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 3 = true := blkChk_join _ _ _ _ _ 127 2 1 h1 okB129
  have h3 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 4 = true := blkChk_join _ _ _ _ _ 127 3 1 h2 okB130
  have h4 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 5 = true := blkChk_join _ _ _ _ _ 127 4 1 h3 okB131
  have h5 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 6 = true := blkChk_join _ _ _ _ _ 127 5 1 h4 okB132
  have h6 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 7 = true := blkChk_join _ _ _ _ _ 127 6 1 h5 okB133
  have h7 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 8 = true := blkChk_join _ _ _ _ _ 127 7 1 h6 okB134
  have h8 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 9 = true := blkChk_join _ _ _ _ _ 127 8 1 h7 okB135
  have h9 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 10 = true := blkChk_join _ _ _ _ _ 127 9 1 h8 okB136
  have h10 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 11 = true := blkChk_join _ _ _ _ _ 127 10 1 h9 okB137
  have h11 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 127 12 = true := blkChk_join _ _ _ _ _ 127 11 1 h10 okB138
  exact h11
end E1.C395X
