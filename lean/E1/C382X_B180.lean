module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB2033 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 1 = true := by decide +kernel
theorem okB2034 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2034 1 = true := by decide +kernel
theorem okB2035 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2035 1 = true := by decide +kernel
theorem okB2036 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2036 1 = true := by decide +kernel
theorem okB2037 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2037 1 = true := by decide +kernel
theorem okB2038 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2038 1 = true := by decide +kernel
theorem okB2039 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2039 1 = true := by decide +kernel
theorem okB2040 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2040 1 = true := by decide +kernel
theorem okB2041 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2041 1 = true := by decide +kernel
theorem okB2042 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2042 1 = true := by decide +kernel
theorem okG180 : glueChkR lits W 2033 10 = true := by decide +kernel
theorem okM180 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 1 = true := okB2033
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 2 = true := blkChk_join _ _ _ _ _ 2033 1 1 h0 okB2034
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 3 = true := blkChk_join _ _ _ _ _ 2033 2 1 h1 okB2035
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 4 = true := blkChk_join _ _ _ _ _ 2033 3 1 h2 okB2036
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 5 = true := blkChk_join _ _ _ _ _ 2033 4 1 h3 okB2037
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 6 = true := blkChk_join _ _ _ _ _ 2033 5 1 h4 okB2038
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 7 = true := blkChk_join _ _ _ _ _ 2033 6 1 h5 okB2039
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 8 = true := blkChk_join _ _ _ _ _ 2033 7 1 h6 okB2040
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 9 = true := blkChk_join _ _ _ _ _ 2033 8 1 h7 okB2041
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2033 10 = true := blkChk_join _ _ _ _ _ 2033 9 1 h8 okB2042
  exact h9
end E1.C382X
