module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_303104 : slOKL 303104 512 = true := by decide +kernel
theorem ok_303616 : slOKL 303616 512 = true := by decide +kernel
theorem ok_304128 : slOKL 304128 512 = true := by decide +kernel
theorem ok_304640 : slOKL 304640 512 = true := by decide +kernel
theorem ok_305152 : slOKL 305152 512 = true := by decide +kernel
theorem ok_305664 : slOKL 305664 512 = true := by decide +kernel
theorem ok_306176 : slOKL 306176 512 = true := by decide +kernel
theorem ok_306688 : slOKL 306688 512 = true := by decide +kernel
end E1P.OK_ptc
