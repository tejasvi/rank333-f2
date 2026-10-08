module
public import R22Port.U_d41d8cd98f00
public import HCap.OK_h485_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.OK_h485
theorem ok_28672 : slOKL 28672 512 = true := by decide +kernel
theorem ok_29184 : slOKL 29184 26 = true := by decide +kernel
end E1G.OK_h485
