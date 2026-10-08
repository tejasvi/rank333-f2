module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB7132 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7132 1 = true := by decide +kernel
theorem okB7133 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7133 1 = true := by decide +kernel
theorem okB7134 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7134 1 = true := by decide +kernel
theorem okG699 : glueChkR lits W 7132 3 = true := by decide +kernel
theorem okM699 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7132 3 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7132 1 = true := okB7132
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7132 2 = true := blkChk_join _ _ _ _ _ 7132 1 1 h0 okB7133
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 7132 3 = true := blkChk_join _ _ _ _ _ 7132 2 1 h1 okB7134
  exact h2
end E1.C384X
