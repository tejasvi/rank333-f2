module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5058 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5058 1 = true := by decide +kernel
theorem okB5059 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5059 1 = true := by decide +kernel
theorem okB5060 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5060 1 = true := by decide +kernel
theorem okB5061 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5061 1 = true := by decide +kernel
theorem okB5062 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5062 1 = true := by decide +kernel
theorem okB5063 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5063 1 = true := by decide +kernel
theorem okB5064 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5064 1 = true := by decide +kernel
theorem okB5065 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5065 1 = true := by decide +kernel
theorem okG484 : glueChkR lits W 5058 8 = true := by decide +kernel
theorem okM484 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5058 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5058 1 = true := okB5058
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5058 2 = true := blkChk_join _ _ _ _ _ 5058 1 1 h0 okB5059
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5058 3 = true := blkChk_join _ _ _ _ _ 5058 2 1 h1 okB5060
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5058 4 = true := blkChk_join _ _ _ _ _ 5058 3 1 h2 okB5061
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5058 5 = true := blkChk_join _ _ _ _ _ 5058 4 1 h3 okB5062
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5058 6 = true := blkChk_join _ _ _ _ _ 5058 5 1 h4 okB5063
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5058 7 = true := blkChk_join _ _ _ _ _ 5058 6 1 h5 okB5064
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5058 8 = true := blkChk_join _ _ _ _ _ 5058 7 1 h6 okB5065
  exact h7
end E1.C384X
