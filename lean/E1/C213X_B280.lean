module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB3009 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3009 1 = true := by decide +kernel
theorem okB3010 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3010 1 = true := by decide +kernel
theorem okB3011 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3011 1 = true := by decide +kernel
theorem okB3012 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3012 1 = true := by decide +kernel
theorem okB3013 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3013 1 = true := by decide +kernel
theorem okB3014 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3014 1 = true := by decide +kernel
theorem okB3015 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3015 1 = true := by decide +kernel
theorem okG280 : glueChkR lits W 3009 7 = true := by decide +kernel
theorem okM280 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3009 7 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3009 1 = true := okB3009
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3009 2 = true := blkChk_join _ _ _ _ _ 3009 1 1 h0 okB3010
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3009 3 = true := blkChk_join _ _ _ _ _ 3009 2 1 h1 okB3011
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3009 4 = true := blkChk_join _ _ _ _ _ 3009 3 1 h2 okB3012
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3009 5 = true := blkChk_join _ _ _ _ _ 3009 4 1 h3 okB3013
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3009 6 = true := blkChk_join _ _ _ _ _ 3009 5 1 h4 okB3014
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3009 7 = true := blkChk_join _ _ _ _ _ 3009 6 1 h5 okB3015
  exact h6
end E1.C213X
