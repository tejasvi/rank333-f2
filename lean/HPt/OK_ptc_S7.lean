module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_28672 : slOKL 28672 512 = true := by decide +kernel
theorem ok_29184 : slOKL 29184 512 = true := by decide +kernel
theorem ok_29696 : slOKL 29696 512 = true := by decide +kernel
theorem ok_30208 : slOKL 30208 512 = true := by decide +kernel
theorem ok_30720 : slOKL 30720 512 = true := by decide +kernel
theorem ok_31232 : slOKL 31232 512 = true := by decide +kernel
theorem ok_31744 : slOKL 31744 512 = true := by decide +kernel
theorem ok_32256 : slOKL 32256 512 = true := by decide +kernel
end E1P.OK_ptc
