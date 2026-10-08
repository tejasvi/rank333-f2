module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C395X
open E1S
theorem okB573 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 573 1 = true := by decide +kernel
theorem okB574 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 574 1 = true := by decide +kernel
theorem okG49 : glueChkR lits W 573 2 = true := by decide +kernel
theorem okM49 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 573 2 = true := by
  have h0 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 573 1 = true := okB573
  have h1 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 573 2 = true := blkChk_join _ _ _ _ _ 573 1 1 h0 okB574
  exact h1
end E1.C395X
