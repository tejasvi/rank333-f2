module
public import R22Port.U_d41d8cd98f00
public import HCap.R450_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R450
open E1GS
theorem okB2 : blkChk E1G.IP_h450.C (E1G.slc E1G.SL_h450.chunk) E1G.IP_h450.UB E1G.IP_h450.UBR lits 32 6 = true := by decide +kernel
end E1G.R450
