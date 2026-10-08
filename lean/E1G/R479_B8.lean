module
public import R22Port.U_d41d8cd98f00
public import E1G.R479_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R479
open E1GS
theorem okB8 : blkChk E1G.IP_l479cw.C (E1G.slc E1G.SL_l479cw.chunk) E1G.IP_l479cw.UB E1G.IP_l479cw.UBR lits 32 4 = true := by decide +kernel
end E1G.R479
