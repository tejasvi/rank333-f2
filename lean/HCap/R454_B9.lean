module
public import R22Port.U_d41d8cd98f00
public import HCap.R454_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R454
open E1GS
theorem okB9 : blkChk E1G.IP_h454.C (E1G.slc E1G.SL_h454.chunk) E1G.IP_h454.UB E1G.IP_h454.UBR lits 144 16 = true := by decide +kernel
end E1G.R454
