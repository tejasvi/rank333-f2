module
public import R22Port.U_d41d8cd98f00
public import HCap.R455_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R455
open E1GS
theorem okB0 : blkChk E1G.IP_h455.C (E1G.slc E1G.SL_h455.chunk) E1G.IP_h455.UB E1G.IP_h455.UBR lits 0 16 = true := by decide +kernel
end E1G.R455
