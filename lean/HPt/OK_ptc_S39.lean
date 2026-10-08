module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_159744 : slOKL 159744 512 = true := by decide +kernel
theorem ok_160256 : slOKL 160256 512 = true := by decide +kernel
theorem ok_160768 : slOKL 160768 512 = true := by decide +kernel
theorem ok_161280 : slOKL 161280 512 = true := by decide +kernel
theorem ok_161792 : slOKL 161792 512 = true := by decide +kernel
theorem ok_162304 : slOKL 162304 512 = true := by decide +kernel
theorem ok_162816 : slOKL 162816 512 = true := by decide +kernel
theorem ok_163328 : slOKL 163328 512 = true := by decide +kernel
end E1P.OK_ptc
