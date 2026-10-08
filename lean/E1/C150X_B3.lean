module
public import R22Port.U_d41d8cd98f00
public import E1.C150X_Lits
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C150X
open E1S
theorem okB3 : blkChk E1.IP_e150.C E1.SL_e150.entry E1.IP_e150.UB E1.IP_e150.UBR lits 3 1 = true := by decide +kernel
end E1.C150X
