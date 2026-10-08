module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB104 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 1 = true := by decide +kernel
theorem okB105 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 105 1 = true := by decide +kernel
theorem okB106 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 106 1 = true := by decide +kernel
theorem okB107 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 107 1 = true := by decide +kernel
theorem okB108 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 108 1 = true := by decide +kernel
theorem okB109 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 109 1 = true := by decide +kernel
theorem okB110 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 110 1 = true := by decide +kernel
theorem okB111 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 111 1 = true := by decide +kernel
theorem okB112 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 112 1 = true := by decide +kernel
theorem okB113 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 113 1 = true := by decide +kernel
theorem okG10 : glueChkR lits W 104 10 = true := by decide +kernel
theorem okM10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 1 = true := okB104
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 2 = true := blkChk_join _ _ _ _ _ 104 1 1 h0 okB105
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 3 = true := blkChk_join _ _ _ _ _ 104 2 1 h1 okB106
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 4 = true := blkChk_join _ _ _ _ _ 104 3 1 h2 okB107
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 5 = true := blkChk_join _ _ _ _ _ 104 4 1 h3 okB108
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 6 = true := blkChk_join _ _ _ _ _ 104 5 1 h4 okB109
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 7 = true := blkChk_join _ _ _ _ _ 104 6 1 h5 okB110
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 8 = true := blkChk_join _ _ _ _ _ 104 7 1 h6 okB111
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 9 = true := blkChk_join _ _ _ _ _ 104 8 1 h7 okB112
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 104 10 = true := blkChk_join _ _ _ _ _ 104 9 1 h8 okB113
  exact h9
end E1.C213X
