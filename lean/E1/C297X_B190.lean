module
public import R22Port.U_d41d8cd98f00
public import E1.C297X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C297X
open E1S
theorem okB2065 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 1 = true := by decide +kernel
theorem okB2066 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2066 1 = true := by decide +kernel
theorem okB2067 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2067 1 = true := by decide +kernel
theorem okB2068 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2068 1 = true := by decide +kernel
theorem okB2069 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2069 1 = true := by decide +kernel
theorem okB2070 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2070 1 = true := by decide +kernel
theorem okB2071 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2071 1 = true := by decide +kernel
theorem okB2072 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2072 1 = true := by decide +kernel
theorem okB2073 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2073 1 = true := by decide +kernel
theorem okB2074 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2074 1 = true := by decide +kernel
theorem okG190 : glueChkR lits W 2065 10 = true := by decide +kernel
theorem okM190 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 10 = true := by
  have h0 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 1 = true := okB2065
  have h1 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 2 = true := blkChk_join _ _ _ _ _ 2065 1 1 h0 okB2066
  have h2 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 3 = true := blkChk_join _ _ _ _ _ 2065 2 1 h1 okB2067
  have h3 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 4 = true := blkChk_join _ _ _ _ _ 2065 3 1 h2 okB2068
  have h4 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 5 = true := blkChk_join _ _ _ _ _ 2065 4 1 h3 okB2069
  have h5 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 6 = true := blkChk_join _ _ _ _ _ 2065 5 1 h4 okB2070
  have h6 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 7 = true := blkChk_join _ _ _ _ _ 2065 6 1 h5 okB2071
  have h7 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 8 = true := blkChk_join _ _ _ _ _ 2065 7 1 h6 okB2072
  have h8 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 9 = true := blkChk_join _ _ _ _ _ 2065 8 1 h7 okB2073
  have h9 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 2065 10 = true := blkChk_join _ _ _ _ _ 2065 9 1 h8 okB2074
  exact h9
end E1.C297X
