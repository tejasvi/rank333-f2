module
public import R22Port.U_d41d8cd98f00
public import E1.C267X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C267X
open E1S
theorem okB1958 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1958 1 = true := by decide +kernel
theorem okB1959 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1959 1 = true := by decide +kernel
theorem okB1960 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1960 1 = true := by decide +kernel
theorem okB1961 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1961 1 = true := by decide +kernel
theorem okB1962 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1962 1 = true := by decide +kernel
theorem okB1963 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1963 1 = true := by decide +kernel
theorem okB1964 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1964 1 = true := by decide +kernel
theorem okB1965 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1965 1 = true := by decide +kernel
theorem okG164 : glueChkR lits W 1958 8 = true := by decide +kernel
theorem okM164 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1958 8 = true := by
  have h0 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1958 1 = true := okB1958
  have h1 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1958 2 = true := blkChk_join _ _ _ _ _ 1958 1 1 h0 okB1959
  have h2 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1958 3 = true := blkChk_join _ _ _ _ _ 1958 2 1 h1 okB1960
  have h3 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1958 4 = true := blkChk_join _ _ _ _ _ 1958 3 1 h2 okB1961
  have h4 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1958 5 = true := blkChk_join _ _ _ _ _ 1958 4 1 h3 okB1962
  have h5 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1958 6 = true := blkChk_join _ _ _ _ _ 1958 5 1 h4 okB1963
  have h6 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1958 7 = true := blkChk_join _ _ _ _ _ 1958 6 1 h5 okB1964
  have h7 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1958 8 = true := blkChk_join _ _ _ _ _ 1958 7 1 h6 okB1965
  exact h7
end E1.C267X
