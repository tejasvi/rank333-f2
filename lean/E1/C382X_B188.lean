module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB2127 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2127 1 = true := by decide +kernel
theorem okB2128 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2128 1 = true := by decide +kernel
theorem okB2129 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2129 1 = true := by decide +kernel
theorem okB2130 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2130 1 = true := by decide +kernel
theorem okB2131 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2131 1 = true := by decide +kernel
theorem okB2132 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2132 1 = true := by decide +kernel
theorem okB2133 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2133 1 = true := by decide +kernel
theorem okG188 : glueChkR lits W 2127 7 = true := by decide +kernel
theorem okM188 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2127 7 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2127 1 = true := okB2127
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2127 2 = true := blkChk_join _ _ _ _ _ 2127 1 1 h0 okB2128
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2127 3 = true := blkChk_join _ _ _ _ _ 2127 2 1 h1 okB2129
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2127 4 = true := blkChk_join _ _ _ _ _ 2127 3 1 h2 okB2130
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2127 5 = true := blkChk_join _ _ _ _ _ 2127 4 1 h3 okB2131
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2127 6 = true := blkChk_join _ _ _ _ _ 2127 5 1 h4 okB2132
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2127 7 = true := blkChk_join _ _ _ _ _ 2127 6 1 h5 okB2133
  exact h6
end E1.C382X
