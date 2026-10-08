module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5012 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 1 = true := by decide +kernel
theorem okB5013 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5013 1 = true := by decide +kernel
theorem okB5014 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5014 1 = true := by decide +kernel
theorem okB5015 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5015 1 = true := by decide +kernel
theorem okB5016 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5016 1 = true := by decide +kernel
theorem okB5017 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5017 1 = true := by decide +kernel
theorem okB5018 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5018 1 = true := by decide +kernel
theorem okB5019 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5019 1 = true := by decide +kernel
theorem okB5020 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5020 1 = true := by decide +kernel
theorem okB5021 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5021 1 = true := by decide +kernel
theorem okB5022 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5022 1 = true := by decide +kernel
theorem okB5023 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5023 1 = true := by decide +kernel
theorem okB5024 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5024 1 = true := by decide +kernel
theorem okG480 : glueChkR lits W 5012 13 = true := by decide +kernel
theorem okM480 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 13 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 1 = true := okB5012
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 2 = true := blkChk_join _ _ _ _ _ 5012 1 1 h0 okB5013
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 3 = true := blkChk_join _ _ _ _ _ 5012 2 1 h1 okB5014
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 4 = true := blkChk_join _ _ _ _ _ 5012 3 1 h2 okB5015
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 5 = true := blkChk_join _ _ _ _ _ 5012 4 1 h3 okB5016
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 6 = true := blkChk_join _ _ _ _ _ 5012 5 1 h4 okB5017
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 7 = true := blkChk_join _ _ _ _ _ 5012 6 1 h5 okB5018
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 8 = true := blkChk_join _ _ _ _ _ 5012 7 1 h6 okB5019
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 9 = true := blkChk_join _ _ _ _ _ 5012 8 1 h7 okB5020
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 10 = true := blkChk_join _ _ _ _ _ 5012 9 1 h8 okB5021
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 11 = true := blkChk_join _ _ _ _ _ 5012 10 1 h9 okB5022
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 12 = true := blkChk_join _ _ _ _ _ 5012 11 1 h10 okB5023
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5012 13 = true := blkChk_join _ _ _ _ _ 5012 12 1 h11 okB5024
  exact h12
end E1.C384X
