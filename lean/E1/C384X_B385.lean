module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4019 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4019 1 = true := by decide +kernel
theorem okB4020 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4020 1 = true := by decide +kernel
theorem okB4021 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4021 1 = true := by decide +kernel
theorem okB4022 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4022 1 = true := by decide +kernel
theorem okB4023 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4023 1 = true := by decide +kernel
theorem okB4024 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4024 1 = true := by decide +kernel
theorem okB4025 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4025 1 = true := by decide +kernel
theorem okB4026 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4026 1 = true := by decide +kernel
theorem okG385 : glueChkR lits W 4019 8 = true := by decide +kernel
theorem okM385 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4019 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4019 1 = true := okB4019
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4019 2 = true := blkChk_join _ _ _ _ _ 4019 1 1 h0 okB4020
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4019 3 = true := blkChk_join _ _ _ _ _ 4019 2 1 h1 okB4021
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4019 4 = true := blkChk_join _ _ _ _ _ 4019 3 1 h2 okB4022
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4019 5 = true := blkChk_join _ _ _ _ _ 4019 4 1 h3 okB4023
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4019 6 = true := blkChk_join _ _ _ _ _ 4019 5 1 h4 okB4024
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4019 7 = true := blkChk_join _ _ _ _ _ 4019 6 1 h5 okB4025
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4019 8 = true := blkChk_join _ _ _ _ _ 4019 7 1 h6 okB4026
  exact h7
end E1.C384X
