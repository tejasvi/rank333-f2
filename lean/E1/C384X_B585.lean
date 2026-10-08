module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6070 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 1 = true := by decide +kernel
theorem okB6071 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6071 1 = true := by decide +kernel
theorem okB6072 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6072 1 = true := by decide +kernel
theorem okB6073 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6073 1 = true := by decide +kernel
theorem okB6074 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6074 1 = true := by decide +kernel
theorem okB6075 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6075 1 = true := by decide +kernel
theorem okB6076 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6076 1 = true := by decide +kernel
theorem okB6077 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6077 1 = true := by decide +kernel
theorem okB6078 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6078 1 = true := by decide +kernel
theorem okG585 : glueChkR lits W 6070 9 = true := by decide +kernel
theorem okM585 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 1 = true := okB6070
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 2 = true := blkChk_join _ _ _ _ _ 6070 1 1 h0 okB6071
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 3 = true := blkChk_join _ _ _ _ _ 6070 2 1 h1 okB6072
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 4 = true := blkChk_join _ _ _ _ _ 6070 3 1 h2 okB6073
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 5 = true := blkChk_join _ _ _ _ _ 6070 4 1 h3 okB6074
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 6 = true := blkChk_join _ _ _ _ _ 6070 5 1 h4 okB6075
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 7 = true := blkChk_join _ _ _ _ _ 6070 6 1 h5 okB6076
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 8 = true := blkChk_join _ _ _ _ _ 6070 7 1 h6 okB6077
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6070 9 = true := blkChk_join _ _ _ _ _ 6070 8 1 h7 okB6078
  exact h8
end E1.C384X
