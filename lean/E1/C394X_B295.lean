module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB3060 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 1 = true := by decide +kernel
theorem okB3061 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3061 1 = true := by decide +kernel
theorem okB3062 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3062 1 = true := by decide +kernel
theorem okB3063 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3063 1 = true := by decide +kernel
theorem okB3064 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3064 1 = true := by decide +kernel
theorem okB3065 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3065 1 = true := by decide +kernel
theorem okB3066 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3066 1 = true := by decide +kernel
theorem okB3067 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3067 1 = true := by decide +kernel
theorem okB3068 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3068 1 = true := by decide +kernel
theorem okG295 : glueChkR lits W 3060 9 = true := by decide +kernel
theorem okM295 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 9 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 1 = true := okB3060
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 2 = true := blkChk_join _ _ _ _ _ 3060 1 1 h0 okB3061
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 3 = true := blkChk_join _ _ _ _ _ 3060 2 1 h1 okB3062
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 4 = true := blkChk_join _ _ _ _ _ 3060 3 1 h2 okB3063
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 5 = true := blkChk_join _ _ _ _ _ 3060 4 1 h3 okB3064
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 6 = true := blkChk_join _ _ _ _ _ 3060 5 1 h4 okB3065
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 7 = true := blkChk_join _ _ _ _ _ 3060 6 1 h5 okB3066
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 8 = true := blkChk_join _ _ _ _ _ 3060 7 1 h6 okB3067
  have h8 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3060 9 = true := blkChk_join _ _ _ _ _ 3060 8 1 h7 okB3068
  exact h8
end E1.C394X
