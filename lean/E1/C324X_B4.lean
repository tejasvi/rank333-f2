module
public import R22Port.U_d41d8cd98f00
public import E1.C324X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C324X
open E1S
theorem okB45 : blkChk E1.IP_e324.C E1.SL_e324.entry E1.IP_e324.UB E1.IP_e324.UBR lits 45 1 = true := by decide +kernel
theorem okG4 : glueChkR lits W 45 1 = true := by decide +kernel
theorem okM4 : blkChk E1.IP_e324.C E1.SL_e324.entry E1.IP_e324.UB E1.IP_e324.UBR lits 45 1 = true := by
  have h0 : blkChk E1.IP_e324.C E1.SL_e324.entry E1.IP_e324.UB E1.IP_e324.UBR lits 45 1 = true := okB45
  exact h0
end E1.C324X
