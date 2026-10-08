module
public import R22Port.U_d41d8cd98f00
public import HCap.H436_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.H436
open E1GS
theorem okB9 : blkChk E1G.IP_h436.C (E1G.slc E1G.SL_h436.chunk) E1G.IP_h436.UB E1G.IP_h436.UBR lits 36 4 = true := by decide +kernel
end E1G.H436
