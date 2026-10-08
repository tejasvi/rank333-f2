module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3012 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 1 = true := by decide +kernel
theorem okB3013 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3013 1 = true := by decide +kernel
theorem okB3014 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3014 1 = true := by decide +kernel
theorem okB3015 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3015 1 = true := by decide +kernel
theorem okB3016 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3016 1 = true := by decide +kernel
theorem okB3017 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3017 1 = true := by decide +kernel
theorem okB3018 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3018 1 = true := by decide +kernel
theorem okB3019 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3019 1 = true := by decide +kernel
theorem okB3020 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3020 1 = true := by decide +kernel
theorem okG286 : glueChkR lits W 3012 9 = true := by decide +kernel
theorem okM286 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 1 = true := okB3012
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 2 = true := blkChk_join _ _ _ _ _ 3012 1 1 h0 okB3013
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 3 = true := blkChk_join _ _ _ _ _ 3012 2 1 h1 okB3014
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 4 = true := blkChk_join _ _ _ _ _ 3012 3 1 h2 okB3015
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 5 = true := blkChk_join _ _ _ _ _ 3012 4 1 h3 okB3016
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 6 = true := blkChk_join _ _ _ _ _ 3012 5 1 h4 okB3017
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 7 = true := blkChk_join _ _ _ _ _ 3012 6 1 h5 okB3018
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 8 = true := blkChk_join _ _ _ _ _ 3012 7 1 h6 okB3019
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3012 9 = true := blkChk_join _ _ _ _ _ 3012 8 1 h7 okB3020
  exact h8
end E1.C384X
