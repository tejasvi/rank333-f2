module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB7011 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7011 1 = true := by decide +kernel
theorem okB7012 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7012 1 = true := by decide +kernel
theorem okB7013 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7013 1 = true := by decide +kernel
theorem okB7014 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7014 1 = true := by decide +kernel
theorem okB7015 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7015 1 = true := by decide +kernel
theorem okB7016 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7016 1 = true := by decide +kernel
theorem okB7017 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7017 1 = true := by decide +kernel
theorem okB7018 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7018 1 = true := by decide +kernel
theorem okG686 : glueChkR lits W 7011 8 = true := by decide +kernel
theorem okM686 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7011 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7011 1 = true := okB7011
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7011 2 = true := blkChk_join _ _ _ _ _ 7011 1 1 h0 okB7012
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7011 3 = true := blkChk_join _ _ _ _ _ 7011 2 1 h1 okB7013
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7011 4 = true := blkChk_join _ _ _ _ _ 7011 3 1 h2 okB7014
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7011 5 = true := blkChk_join _ _ _ _ _ 7011 4 1 h3 okB7015
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7011 6 = true := blkChk_join _ _ _ _ _ 7011 5 1 h4 okB7016
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7011 7 = true := blkChk_join _ _ _ _ _ 7011 6 1 h5 okB7017
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7011 8 = true := blkChk_join _ _ _ _ _ 7011 7 1 h6 okB7018
  exact h7
end E1.C384X
