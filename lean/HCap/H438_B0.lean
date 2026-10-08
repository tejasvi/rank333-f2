module
public import R22Port.U_d41d8cd98f00
public import HCap.H438_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.H438
open E1GS
theorem okB0 : blkChk E1G.IP_h438.C (E1G.slc E1G.SL_h438.chunk) E1G.IP_h438.UB E1G.IP_h438.UBR lits 0 1 = true := by decide +kernel
end E1G.H438
