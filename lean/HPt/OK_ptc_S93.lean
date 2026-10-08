module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_380928 : slOKL 380928 512 = true := by decide +kernel
theorem ok_381440 : slOKL 381440 512 = true := by decide +kernel
theorem ok_381952 : slOKL 381952 512 = true := by decide +kernel
theorem ok_382464 : slOKL 382464 512 = true := by decide +kernel
theorem ok_382976 : slOKL 382976 512 = true := by decide +kernel
theorem ok_383488 : slOKL 383488 512 = true := by decide +kernel
theorem ok_384000 : slOKL 384000 512 = true := by decide +kernel
theorem ok_384512 : slOKL 384512 512 = true := by decide +kernel
end E1P.OK_ptc
