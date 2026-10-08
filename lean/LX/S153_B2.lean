module
public import R22Port.U_d41d8cd98f00
public import LX.S153_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.S153
open E1GS
theorem okB2 : blkChk E1G.IP_l479cw.C (E1G.slc E1G.SL_l479cw.chunk) E1G.IP_l479cw.UB E1G.IP_l479cw.UBR lits 16 8 = true := by decide +kernel
end E1G.S153
