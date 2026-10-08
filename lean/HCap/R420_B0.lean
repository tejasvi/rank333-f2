module
public import R22Port.U_d41d8cd98f00
public import HCap.R420_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R420
open E1GS
theorem okB0 : blkChk E1G.IP_h420.C (E1G.slc E1G.SL_h420.chunk) E1G.IP_h420.UB E1G.IP_h420.UBR lits 0 7 = true := by decide +kernel
end E1G.R420
