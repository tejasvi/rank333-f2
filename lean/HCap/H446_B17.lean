module
public import R22Port.U_d41d8cd98f00
public import HCap.H446_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.H446
open E1GS
theorem okB17 : blkChk E1G.IP_h446.C (E1G.slc E1G.SL_h446.chunk) E1G.IP_h446.UB E1G.IP_h446.UBR lits 68 4 = true := by decide +kernel
end E1G.H446
