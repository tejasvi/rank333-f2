module
public import R22Port.U_d41d8cd98f00
public import E1.C311X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C311X
open E1S
theorem okG36 : glueChkR lits W 2304 64 = true := by decide +kernel
end E1.C311X
