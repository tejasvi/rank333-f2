module
public import R22Port.U_d41d8cd98f00
public import HCap.R490_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R490
open E1GS
theorem okB11 : blkChk E1G.IP_h490.C (E1G.slc E1G.SL_h490.chunk) E1G.IP_h490.UB E1G.IP_h490.UBR lits 176 15 = true := by decide +kernel
end E1G.R490
