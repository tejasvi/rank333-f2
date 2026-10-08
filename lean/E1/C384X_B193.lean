module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2063 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 1 = true := by decide +kernel
theorem okB2064 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2064 1 = true := by decide +kernel
theorem okB2065 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2065 1 = true := by decide +kernel
theorem okB2066 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2066 1 = true := by decide +kernel
theorem okB2067 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2067 1 = true := by decide +kernel
theorem okB2068 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2068 1 = true := by decide +kernel
theorem okB2069 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2069 1 = true := by decide +kernel
theorem okB2070 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2070 1 = true := by decide +kernel
theorem okB2071 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2071 1 = true := by decide +kernel
theorem okG193 : glueChkR lits W 2063 9 = true := by decide +kernel
theorem okM193 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 1 = true := okB2063
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 2 = true := blkChk_join _ _ _ _ _ 2063 1 1 h0 okB2064
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 3 = true := blkChk_join _ _ _ _ _ 2063 2 1 h1 okB2065
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 4 = true := blkChk_join _ _ _ _ _ 2063 3 1 h2 okB2066
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 5 = true := blkChk_join _ _ _ _ _ 2063 4 1 h3 okB2067
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 6 = true := blkChk_join _ _ _ _ _ 2063 5 1 h4 okB2068
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 7 = true := blkChk_join _ _ _ _ _ 2063 6 1 h5 okB2069
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 8 = true := blkChk_join _ _ _ _ _ 2063 7 1 h6 okB2070
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2063 9 = true := blkChk_join _ _ _ _ _ 2063 8 1 h7 okB2071
  exact h8
end E1.C384X
