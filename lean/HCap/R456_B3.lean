module
public import R22Port.U_d41d8cd98f00
public import HCap.R456_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.R456
open E1GS
theorem okB3 : blkChk E1G.IP_h456.C (E1G.slc E1G.SL_h456.chunk) E1G.IP_h456.UB E1G.IP_h456.UBR lits 48 16 = true := by decide +kernel
end E1G.R456
