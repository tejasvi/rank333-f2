module
public import R22Port.U_d41d8cd98f00
public import HCap.R485_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R485
open E1GS
theorem okB2 : blkChk E1G.IP_h485.C (E1G.slc E1G.SL_h485.chunk) E1G.IP_h485.UB E1G.IP_h485.UBR lits 32 16 = true := by decide +kernel
end E1G.R485
