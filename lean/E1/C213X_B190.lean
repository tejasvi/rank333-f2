module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB2061 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 1 = true := by decide +kernel
theorem okB2062 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2062 1 = true := by decide +kernel
theorem okB2063 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2063 1 = true := by decide +kernel
theorem okB2064 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2064 1 = true := by decide +kernel
theorem okB2065 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2065 1 = true := by decide +kernel
theorem okB2066 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2066 1 = true := by decide +kernel
theorem okB2067 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2067 1 = true := by decide +kernel
theorem okB2068 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2068 1 = true := by decide +kernel
theorem okB2069 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2069 1 = true := by decide +kernel
theorem okB2070 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2070 1 = true := by decide +kernel
theorem okB2071 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2071 1 = true := by decide +kernel
theorem okG190 : glueChkR lits W 2061 11 = true := by decide +kernel
theorem okM190 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 11 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 1 = true := okB2061
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 2 = true := blkChk_join _ _ _ _ _ 2061 1 1 h0 okB2062
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 3 = true := blkChk_join _ _ _ _ _ 2061 2 1 h1 okB2063
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 4 = true := blkChk_join _ _ _ _ _ 2061 3 1 h2 okB2064
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 5 = true := blkChk_join _ _ _ _ _ 2061 4 1 h3 okB2065
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 6 = true := blkChk_join _ _ _ _ _ 2061 5 1 h4 okB2066
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 7 = true := blkChk_join _ _ _ _ _ 2061 6 1 h5 okB2067
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 8 = true := blkChk_join _ _ _ _ _ 2061 7 1 h6 okB2068
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 9 = true := blkChk_join _ _ _ _ _ 2061 8 1 h7 okB2069
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 10 = true := blkChk_join _ _ _ _ _ 2061 9 1 h8 okB2070
  have h10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2061 11 = true := blkChk_join _ _ _ _ _ 2061 10 1 h9 okB2071
  exact h10
end E1.C213X
