module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_143360 : slOKL 143360 512 = true := by decide +kernel
theorem ok_143872 : slOKL 143872 512 = true := by decide +kernel
theorem ok_144384 : slOKL 144384 512 = true := by decide +kernel
theorem ok_144896 : slOKL 144896 512 = true := by decide +kernel
theorem ok_145408 : slOKL 145408 512 = true := by decide +kernel
theorem ok_145920 : slOKL 145920 512 = true := by decide +kernel
theorem ok_146432 : slOKL 146432 512 = true := by decide +kernel
theorem ok_146944 : slOKL 146944 512 = true := by decide +kernel
end E1P.OK_ptc
