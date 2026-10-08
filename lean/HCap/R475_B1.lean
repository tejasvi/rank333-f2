module
public import R22Port.U_d41d8cd98f00
public import HCap.R475_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R475
open E1GS
theorem okB1 : blkChk E1G.IP_h475.C (E1G.slc E1G.SL_h475.chunk) E1G.IP_h475.UB E1G.IP_h475.UBR lits 16 8 = true := by decide +kernel
end E1G.R475
