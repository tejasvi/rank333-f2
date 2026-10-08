module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3054 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 1 = true := by decide +kernel
theorem okB3055 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3055 1 = true := by decide +kernel
theorem okB3056 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3056 1 = true := by decide +kernel
theorem okB3057 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3057 1 = true := by decide +kernel
theorem okB3058 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3058 1 = true := by decide +kernel
theorem okB3059 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3059 1 = true := by decide +kernel
theorem okB3060 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3060 1 = true := by decide +kernel
theorem okB3061 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3061 1 = true := by decide +kernel
theorem okB3062 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3062 1 = true := by decide +kernel
theorem okG290 : glueChkR lits W 3054 9 = true := by decide +kernel
theorem okM290 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 1 = true := okB3054
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 2 = true := blkChk_join _ _ _ _ _ 3054 1 1 h0 okB3055
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 3 = true := blkChk_join _ _ _ _ _ 3054 2 1 h1 okB3056
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 4 = true := blkChk_join _ _ _ _ _ 3054 3 1 h2 okB3057
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 5 = true := blkChk_join _ _ _ _ _ 3054 4 1 h3 okB3058
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 6 = true := blkChk_join _ _ _ _ _ 3054 5 1 h4 okB3059
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 7 = true := blkChk_join _ _ _ _ _ 3054 6 1 h5 okB3060
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 8 = true := blkChk_join _ _ _ _ _ 3054 7 1 h6 okB3061
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3054 9 = true := blkChk_join _ _ _ _ _ 3054 8 1 h7 okB3062
  exact h8
end E1.C384X
