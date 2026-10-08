module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB6061 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 1 = true := by decide +kernel
theorem okB6062 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6062 1 = true := by decide +kernel
theorem okB6063 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6063 1 = true := by decide +kernel
theorem okB6064 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6064 1 = true := by decide +kernel
theorem okB6065 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6065 1 = true := by decide +kernel
theorem okB6066 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6066 1 = true := by decide +kernel
theorem okB6067 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6067 1 = true := by decide +kernel
theorem okB6068 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6068 1 = true := by decide +kernel
theorem okB6069 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6069 1 = true := by decide +kernel
theorem okB6070 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6070 1 = true := by decide +kernel
theorem okB6071 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6071 1 = true := by decide +kernel
theorem okG548 : glueChkR lits W 6061 11 = true := by decide +kernel
theorem okM548 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 11 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 1 = true := okB6061
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 2 = true := blkChk_join _ _ _ _ _ 6061 1 1 h0 okB6062
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 3 = true := blkChk_join _ _ _ _ _ 6061 2 1 h1 okB6063
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 4 = true := blkChk_join _ _ _ _ _ 6061 3 1 h2 okB6064
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 5 = true := blkChk_join _ _ _ _ _ 6061 4 1 h3 okB6065
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 6 = true := blkChk_join _ _ _ _ _ 6061 5 1 h4 okB6066
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 7 = true := blkChk_join _ _ _ _ _ 6061 6 1 h5 okB6067
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 8 = true := blkChk_join _ _ _ _ _ 6061 7 1 h6 okB6068
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 9 = true := blkChk_join _ _ _ _ _ 6061 8 1 h7 okB6069
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 10 = true := blkChk_join _ _ _ _ _ 6061 9 1 h8 okB6070
  have h10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 6061 11 = true := blkChk_join _ _ _ _ _ 6061 10 1 h9 okB6071
  exact h10
end E1.C213X
