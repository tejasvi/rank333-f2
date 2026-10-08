module
public import R22Port.U_d41d8cd98f00
public import E1.C207X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C207X
open E1S
theorem okB1062 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1062 1 = true := by decide +kernel
theorem okB1063 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1063 1 = true := by decide +kernel
theorem okB1064 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1064 1 = true := by decide +kernel
theorem okB1065 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1065 1 = true := by decide +kernel
theorem okB1066 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1066 1 = true := by decide +kernel
theorem okB1067 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1067 1 = true := by decide +kernel
theorem okB1068 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1068 1 = true := by decide +kernel
theorem okG90 : glueChkR lits W 1062 7 = true := by decide +kernel
theorem okM90 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1062 7 = true := by
  have h0 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1062 1 = true := okB1062
  have h1 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1062 2 = true := blkChk_join _ _ _ _ _ 1062 1 1 h0 okB1063
  have h2 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1062 3 = true := blkChk_join _ _ _ _ _ 1062 2 1 h1 okB1064
  have h3 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1062 4 = true := blkChk_join _ _ _ _ _ 1062 3 1 h2 okB1065
  have h4 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1062 5 = true := blkChk_join _ _ _ _ _ 1062 4 1 h3 okB1066
  have h5 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1062 6 = true := blkChk_join _ _ _ _ _ 1062 5 1 h4 okB1067
  have h6 : blkChk E1.IP_e207.C E1.SL_e207.entry E1.IP_e207.UB E1.IP_e207.UBR lits 1062 7 = true := blkChk_join _ _ _ _ _ 1062 6 1 h5 okB1068
  exact h6
end E1.C207X
