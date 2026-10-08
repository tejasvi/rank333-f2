module
public import R22Port.U_d41d8cd98f00
public import E1.C392X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C392X
open E1S
theorem okB1010 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 1 = true := by decide +kernel
theorem okB1011 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1011 1 = true := by decide +kernel
theorem okB1012 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1012 1 = true := by decide +kernel
theorem okB1013 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1013 1 = true := by decide +kernel
theorem okB1014 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1014 1 = true := by decide +kernel
theorem okB1015 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1015 1 = true := by decide +kernel
theorem okB1016 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1016 1 = true := by decide +kernel
theorem okB1017 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1017 1 = true := by decide +kernel
theorem okB1018 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1018 1 = true := by decide +kernel
theorem okB1019 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1019 1 = true := by decide +kernel
theorem okB1020 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1020 1 = true := by decide +kernel
theorem okB1021 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1021 1 = true := by decide +kernel
theorem okG85 : glueChkR lits W 1010 12 = true := by decide +kernel
theorem okM85 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 12 = true := by
  have h0 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 1 = true := okB1010
  have h1 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 2 = true := blkChk_join _ _ _ _ _ 1010 1 1 h0 okB1011
  have h2 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 3 = true := blkChk_join _ _ _ _ _ 1010 2 1 h1 okB1012
  have h3 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 4 = true := blkChk_join _ _ _ _ _ 1010 3 1 h2 okB1013
  have h4 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 5 = true := blkChk_join _ _ _ _ _ 1010 4 1 h3 okB1014
  have h5 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 6 = true := blkChk_join _ _ _ _ _ 1010 5 1 h4 okB1015
  have h6 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 7 = true := blkChk_join _ _ _ _ _ 1010 6 1 h5 okB1016
  have h7 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 8 = true := blkChk_join _ _ _ _ _ 1010 7 1 h6 okB1017
  have h8 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 9 = true := blkChk_join _ _ _ _ _ 1010 8 1 h7 okB1018
  have h9 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 10 = true := blkChk_join _ _ _ _ _ 1010 9 1 h8 okB1019
  have h10 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 11 = true := blkChk_join _ _ _ _ _ 1010 10 1 h9 okB1020
  have h11 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 1010 12 = true := blkChk_join _ _ _ _ _ 1010 11 1 h10 okB1021
  exact h11
end E1.C392X
