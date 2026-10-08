module
public import R22Port.U_d41d8cd98f00
public import HPt.Rptc_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.Rptc
open E1PS
theorem okB9 : blkChk E1P.IP_ptc.C (E1P.slc E1P.SL_ptc.chunk) E1P.IP_ptc.UB E1P.IP_ptc.UBR lits 72 8 = true := by decide +kernel
end E1P.Rptc
