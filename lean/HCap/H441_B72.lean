module
public import R22Port.U_d41d8cd98f00
public import HCap.H441_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.H441
open E1GS
theorem okB72 : blkChk E1G.IP_h441.C (E1G.slc E1G.SL_h441.chunk) E1G.IP_h441.UB E1G.IP_h441.UBR lits 288 4 = true := by decide +kernel
end E1G.H441
