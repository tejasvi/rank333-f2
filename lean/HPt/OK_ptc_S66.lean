module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_270336 : slOKL 270336 512 = true := by decide +kernel
theorem ok_270848 : slOKL 270848 512 = true := by decide +kernel
theorem ok_271360 : slOKL 271360 512 = true := by decide +kernel
theorem ok_271872 : slOKL 271872 512 = true := by decide +kernel
theorem ok_272384 : slOKL 272384 512 = true := by decide +kernel
theorem ok_272896 : slOKL 272896 512 = true := by decide +kernel
theorem ok_273408 : slOKL 273408 512 = true := by decide +kernel
theorem ok_273920 : slOKL 273920 512 = true := by decide +kernel
end E1P.OK_ptc
