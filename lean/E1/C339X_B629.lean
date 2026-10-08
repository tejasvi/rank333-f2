module
public import R22Port.U_d41d8cd98f00
public import E1.C339X_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C339X
open E1S
theorem okB629 : blkChk E1.IP_e339.C E1.SL_e339.entry E1.IP_e339.UB E1.IP_e339.UBR lits 629 1 = true := by decide +kernel
end E1.C339X
