module
public import R22Port.U_d41d8cd98f00
public import E1.C292X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C292X
open E1S
theorem okB12 : blkChk E1.IP_e292.C E1.SL_e292.entry E1.IP_e292.UB E1.IP_e292.UBR lits 12 1 = true := by decide +kernel
theorem okB13 : blkChk E1.IP_e292.C E1.SL_e292.entry E1.IP_e292.UB E1.IP_e292.UBR lits 13 1 = true := by decide +kernel
theorem okB14 : blkChk E1.IP_e292.C E1.SL_e292.entry E1.IP_e292.UB E1.IP_e292.UBR lits 14 1 = true := by decide +kernel
theorem okB15 : blkChk E1.IP_e292.C E1.SL_e292.entry E1.IP_e292.UB E1.IP_e292.UBR lits 15 1 = true := by decide +kernel
theorem okG1 : glueChkR lits W 12 4 = true := by decide +kernel
theorem okM1 : blkChk E1.IP_e292.C E1.SL_e292.entry E1.IP_e292.UB E1.IP_e292.UBR lits 12 4 = true := by
  have h0 : blkChk E1.IP_e292.C E1.SL_e292.entry E1.IP_e292.UB E1.IP_e292.UBR lits 12 1 = true := okB12
  have h1 : blkChk E1.IP_e292.C E1.SL_e292.entry E1.IP_e292.UB E1.IP_e292.UBR lits 12 2 = true := blkChk_join _ _ _ _ _ 12 1 1 h0 okB13
  have h2 : blkChk E1.IP_e292.C E1.SL_e292.entry E1.IP_e292.UB E1.IP_e292.UBR lits 12 3 = true := blkChk_join _ _ _ _ _ 12 2 1 h1 okB14
  have h3 : blkChk E1.IP_e292.C E1.SL_e292.entry E1.IP_e292.UB E1.IP_e292.UBR lits 12 4 = true := blkChk_join _ _ _ _ _ 12 3 1 h2 okB15
  exact h3
end E1.C292X
