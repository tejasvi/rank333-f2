module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4960 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 1 = true := by decide +kernel
theorem okB4961 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4961 1 = true := by decide +kernel
theorem okB4962 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4962 1 = true := by decide +kernel
theorem okB4963 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4963 1 = true := by decide +kernel
theorem okB4964 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4964 1 = true := by decide +kernel
theorem okB4965 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4965 1 = true := by decide +kernel
theorem okB4966 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4966 1 = true := by decide +kernel
theorem okB4967 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4967 1 = true := by decide +kernel
theorem okB4968 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4968 1 = true := by decide +kernel
theorem okB4969 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4969 1 = true := by decide +kernel
theorem okB4970 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4970 1 = true := by decide +kernel
theorem okB4971 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4971 1 = true := by decide +kernel
theorem okG476 : glueChkR lits W 4960 12 = true := by decide +kernel
theorem okM476 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 1 = true := okB4960
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 2 = true := blkChk_join _ _ _ _ _ 4960 1 1 h0 okB4961
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 3 = true := blkChk_join _ _ _ _ _ 4960 2 1 h1 okB4962
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 4 = true := blkChk_join _ _ _ _ _ 4960 3 1 h2 okB4963
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 5 = true := blkChk_join _ _ _ _ _ 4960 4 1 h3 okB4964
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 6 = true := blkChk_join _ _ _ _ _ 4960 5 1 h4 okB4965
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 7 = true := blkChk_join _ _ _ _ _ 4960 6 1 h5 okB4966
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 8 = true := blkChk_join _ _ _ _ _ 4960 7 1 h6 okB4967
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 9 = true := blkChk_join _ _ _ _ _ 4960 8 1 h7 okB4968
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 10 = true := blkChk_join _ _ _ _ _ 4960 9 1 h8 okB4969
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 11 = true := blkChk_join _ _ _ _ _ 4960 10 1 h9 okB4970
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4960 12 = true := blkChk_join _ _ _ _ _ 4960 11 1 h10 okB4971
  exact h11
end E1.C384X
