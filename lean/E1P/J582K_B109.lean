module
public import R22Port.U_d41d8cd98f00
public import E1P.J582K_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.J582K
open E1PS
theorem okB109 : blkChk E1P.IP_pt.C (E1P.slc E1P.SL_pt.chunk) E1P.IP_pt.UB E1P.IP_pt.UBR lits 872 8 = true := by decide +kernel
end E1P.J582K
