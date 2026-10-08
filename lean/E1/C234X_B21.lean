module
public import R22Port.U_d41d8cd98f00
public import E1.C234X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C234X
open E1S
theorem okB220 : blkChk E1.IP_e234.C E1.SL_e234.entry E1.IP_e234.UB E1.IP_e234.UBR lits 220 1 = true := by decide +kernel
theorem okG21 : glueChkR lits W 220 1 = true := by decide +kernel
theorem okM21 : blkChk E1.IP_e234.C E1.SL_e234.entry E1.IP_e234.UB E1.IP_e234.UBR lits 220 1 = true := by
  have h0 : blkChk E1.IP_e234.C E1.SL_e234.entry E1.IP_e234.UB E1.IP_e234.UBR lits 220 1 = true := okB220
  exact h0
end E1.C234X
