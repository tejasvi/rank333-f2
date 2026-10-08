module
public import R22Port.U_d41d8cd98f00
public import E1.C218X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C218X
open E1S
theorem okB1004 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 1 = true := by decide +kernel
theorem okB1005 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1005 1 = true := by decide +kernel
theorem okB1006 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1006 1 = true := by decide +kernel
theorem okB1007 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1007 1 = true := by decide +kernel
theorem okB1008 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1008 1 = true := by decide +kernel
theorem okB1009 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1009 1 = true := by decide +kernel
theorem okB1010 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1010 1 = true := by decide +kernel
theorem okB1011 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1011 1 = true := by decide +kernel
theorem okB1012 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1012 1 = true := by decide +kernel
theorem okB1013 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1013 1 = true := by decide +kernel
theorem okG95 : glueChkR lits W 1004 10 = true := by decide +kernel
theorem okM95 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 10 = true := by
  have h0 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 1 = true := okB1004
  have h1 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 2 = true := blkChk_join _ _ _ _ _ 1004 1 1 h0 okB1005
  have h2 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 3 = true := blkChk_join _ _ _ _ _ 1004 2 1 h1 okB1006
  have h3 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 4 = true := blkChk_join _ _ _ _ _ 1004 3 1 h2 okB1007
  have h4 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 5 = true := blkChk_join _ _ _ _ _ 1004 4 1 h3 okB1008
  have h5 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 6 = true := blkChk_join _ _ _ _ _ 1004 5 1 h4 okB1009
  have h6 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 7 = true := blkChk_join _ _ _ _ _ 1004 6 1 h5 okB1010
  have h7 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 8 = true := blkChk_join _ _ _ _ _ 1004 7 1 h6 okB1011
  have h8 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 9 = true := blkChk_join _ _ _ _ _ 1004 8 1 h7 okB1012
  have h9 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 1004 10 = true := blkChk_join _ _ _ _ _ 1004 9 1 h8 okB1013
  exact h9
end E1.C218X
