module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB2095 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 1 = true := by decide +kernel
theorem okB2096 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2096 1 = true := by decide +kernel
theorem okB2097 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2097 1 = true := by decide +kernel
theorem okB2098 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2098 1 = true := by decide +kernel
theorem okB2099 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2099 1 = true := by decide +kernel
theorem okB2100 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2100 1 = true := by decide +kernel
theorem okB2101 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2101 1 = true := by decide +kernel
theorem okB2102 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2102 1 = true := by decide +kernel
theorem okB2103 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2103 1 = true := by decide +kernel
theorem okB2104 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2104 1 = true := by decide +kernel
theorem okG185 : glueChkR lits W 2095 10 = true := by decide +kernel
theorem okM185 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 1 = true := okB2095
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 2 = true := blkChk_join _ _ _ _ _ 2095 1 1 h0 okB2096
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 3 = true := blkChk_join _ _ _ _ _ 2095 2 1 h1 okB2097
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 4 = true := blkChk_join _ _ _ _ _ 2095 3 1 h2 okB2098
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 5 = true := blkChk_join _ _ _ _ _ 2095 4 1 h3 okB2099
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 6 = true := blkChk_join _ _ _ _ _ 2095 5 1 h4 okB2100
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 7 = true := blkChk_join _ _ _ _ _ 2095 6 1 h5 okB2101
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 8 = true := blkChk_join _ _ _ _ _ 2095 7 1 h6 okB2102
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 9 = true := blkChk_join _ _ _ _ _ 2095 8 1 h7 okB2103
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2095 10 = true := blkChk_join _ _ _ _ _ 2095 9 1 h8 okB2104
  exact h9
end E1.C382X
