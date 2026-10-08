module
public import R22Port.U_d41d8cd98f00
public import HCap.R487_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R487
open E1GS
theorem okB16 : blkChk E1G.IP_h487.C (E1G.slc E1G.SL_h487.chunk) E1G.IP_h487.UB E1G.IP_h487.UBR lits 256 16 = true := by decide +kernel
end E1G.R487
