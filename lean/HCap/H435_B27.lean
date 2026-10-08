module
public import R22Port.U_d41d8cd98f00
public import HCap.H435_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.H435
open E1GS
theorem okB27 : blkChk E1G.IP_h435.C (E1G.slc E1G.SL_h435.chunk) E1G.IP_h435.UB E1G.IP_h435.UBR lits 108 4 = true := by decide +kernel
end E1G.H435
