module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB2059 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 1 = true := by decide +kernel
theorem okB2060 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2060 1 = true := by decide +kernel
theorem okB2061 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2061 1 = true := by decide +kernel
theorem okB2062 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2062 1 = true := by decide +kernel
theorem okB2063 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2063 1 = true := by decide +kernel
theorem okB2064 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2064 1 = true := by decide +kernel
theorem okB2065 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2065 1 = true := by decide +kernel
theorem okB2066 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2066 1 = true := by decide +kernel
theorem okB2067 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2067 1 = true := by decide +kernel
theorem okB2068 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2068 1 = true := by decide +kernel
theorem okG182 : glueChkR lits W 2059 10 = true := by decide +kernel
theorem okM182 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 1 = true := okB2059
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 2 = true := blkChk_join _ _ _ _ _ 2059 1 1 h0 okB2060
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 3 = true := blkChk_join _ _ _ _ _ 2059 2 1 h1 okB2061
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 4 = true := blkChk_join _ _ _ _ _ 2059 3 1 h2 okB2062
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 5 = true := blkChk_join _ _ _ _ _ 2059 4 1 h3 okB2063
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 6 = true := blkChk_join _ _ _ _ _ 2059 5 1 h4 okB2064
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 7 = true := blkChk_join _ _ _ _ _ 2059 6 1 h5 okB2065
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 8 = true := blkChk_join _ _ _ _ _ 2059 7 1 h6 okB2066
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 9 = true := blkChk_join _ _ _ _ _ 2059 8 1 h7 okB2067
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2059 10 = true := blkChk_join _ _ _ _ _ 2059 9 1 h8 okB2068
  exact h9
end E1.C382X
