module
public import R22Port.U_d41d8cd98f00
public import E1.C406X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C406X
open E1S
theorem okB0 : blkChk E1.IP_e406.C E1.SL_e406.entry E1.IP_e406.UB E1.IP_e406.UBR lits 0 1 = true := by decide +kernel
theorem okG0 : glueChkR lits W 0 1 = true := by decide +kernel
theorem okM0 : blkChk E1.IP_e406.C E1.SL_e406.entry E1.IP_e406.UB E1.IP_e406.UBR lits 0 1 = true := by
  have h0 : blkChk E1.IP_e406.C E1.SL_e406.entry E1.IP_e406.UB E1.IP_e406.UBR lits 0 1 = true := okB0
  exact h0
end E1.C406X
