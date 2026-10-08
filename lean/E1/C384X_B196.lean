module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2096 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 1 = true := by decide +kernel
theorem okB2097 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2097 1 = true := by decide +kernel
theorem okB2098 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2098 1 = true := by decide +kernel
theorem okB2099 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2099 1 = true := by decide +kernel
theorem okB2100 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2100 1 = true := by decide +kernel
theorem okB2101 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2101 1 = true := by decide +kernel
theorem okB2102 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2102 1 = true := by decide +kernel
theorem okB2103 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2103 1 = true := by decide +kernel
theorem okB2104 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2104 1 = true := by decide +kernel
theorem okB2105 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2105 1 = true := by decide +kernel
theorem okB2106 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2106 1 = true := by decide +kernel
theorem okG196 : glueChkR lits W 2096 11 = true := by decide +kernel
theorem okM196 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 1 = true := okB2096
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 2 = true := blkChk_join _ _ _ _ _ 2096 1 1 h0 okB2097
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 3 = true := blkChk_join _ _ _ _ _ 2096 2 1 h1 okB2098
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 4 = true := blkChk_join _ _ _ _ _ 2096 3 1 h2 okB2099
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 5 = true := blkChk_join _ _ _ _ _ 2096 4 1 h3 okB2100
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 6 = true := blkChk_join _ _ _ _ _ 2096 5 1 h4 okB2101
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 7 = true := blkChk_join _ _ _ _ _ 2096 6 1 h5 okB2102
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 8 = true := blkChk_join _ _ _ _ _ 2096 7 1 h6 okB2103
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 9 = true := blkChk_join _ _ _ _ _ 2096 8 1 h7 okB2104
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 10 = true := blkChk_join _ _ _ _ _ 2096 9 1 h8 okB2105
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2096 11 = true := blkChk_join _ _ _ _ _ 2096 10 1 h9 okB2106
  exact h10
end E1.C384X
