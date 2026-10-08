module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_253952 : slOKL 253952 512 = true := by decide +kernel
theorem ok_254464 : slOKL 254464 512 = true := by decide +kernel
theorem ok_254976 : slOKL 254976 512 = true := by decide +kernel
theorem ok_255488 : slOKL 255488 512 = true := by decide +kernel
theorem ok_256000 : slOKL 256000 512 = true := by decide +kernel
theorem ok_256512 : slOKL 256512 512 = true := by decide +kernel
theorem ok_257024 : slOKL 257024 512 = true := by decide +kernel
theorem ok_257536 : slOKL 257536 512 = true := by decide +kernel
end E1P.OK_ptc
