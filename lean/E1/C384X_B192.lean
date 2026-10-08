module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2054 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 1 = true := by decide +kernel
theorem okB2055 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2055 1 = true := by decide +kernel
theorem okB2056 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2056 1 = true := by decide +kernel
theorem okB2057 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2057 1 = true := by decide +kernel
theorem okB2058 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2058 1 = true := by decide +kernel
theorem okB2059 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2059 1 = true := by decide +kernel
theorem okB2060 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2060 1 = true := by decide +kernel
theorem okB2061 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2061 1 = true := by decide +kernel
theorem okB2062 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2062 1 = true := by decide +kernel
theorem okG192 : glueChkR lits W 2054 9 = true := by decide +kernel
theorem okM192 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 1 = true := okB2054
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 2 = true := blkChk_join _ _ _ _ _ 2054 1 1 h0 okB2055
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 3 = true := blkChk_join _ _ _ _ _ 2054 2 1 h1 okB2056
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 4 = true := blkChk_join _ _ _ _ _ 2054 3 1 h2 okB2057
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 5 = true := blkChk_join _ _ _ _ _ 2054 4 1 h3 okB2058
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 6 = true := blkChk_join _ _ _ _ _ 2054 5 1 h4 okB2059
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 7 = true := blkChk_join _ _ _ _ _ 2054 6 1 h5 okB2060
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 8 = true := blkChk_join _ _ _ _ _ 2054 7 1 h6 okB2061
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2054 9 = true := blkChk_join _ _ _ _ _ 2054 8 1 h7 okB2062
  exact h8
end E1.C384X
