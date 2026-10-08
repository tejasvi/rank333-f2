module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2136 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 1 = true := by decide +kernel
theorem okB2137 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2137 1 = true := by decide +kernel
theorem okB2138 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2138 1 = true := by decide +kernel
theorem okB2139 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2139 1 = true := by decide +kernel
theorem okB2140 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2140 1 = true := by decide +kernel
theorem okB2141 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2141 1 = true := by decide +kernel
theorem okB2142 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2142 1 = true := by decide +kernel
theorem okB2143 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2143 1 = true := by decide +kernel
theorem okB2144 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2144 1 = true := by decide +kernel
theorem okG199 : glueChkR lits W 2136 9 = true := by decide +kernel
theorem okM199 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 1 = true := okB2136
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 2 = true := blkChk_join _ _ _ _ _ 2136 1 1 h0 okB2137
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 3 = true := blkChk_join _ _ _ _ _ 2136 2 1 h1 okB2138
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 4 = true := blkChk_join _ _ _ _ _ 2136 3 1 h2 okB2139
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 5 = true := blkChk_join _ _ _ _ _ 2136 4 1 h3 okB2140
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 6 = true := blkChk_join _ _ _ _ _ 2136 5 1 h4 okB2141
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 7 = true := blkChk_join _ _ _ _ _ 2136 6 1 h5 okB2142
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 8 = true := blkChk_join _ _ _ _ _ 2136 7 1 h6 okB2143
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2136 9 = true := blkChk_join _ _ _ _ _ 2136 8 1 h7 okB2144
  exact h8
end E1.C384X
