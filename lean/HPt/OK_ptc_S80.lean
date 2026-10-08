module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_327680 : slOKL 327680 512 = true := by decide +kernel
theorem ok_328192 : slOKL 328192 512 = true := by decide +kernel
theorem ok_328704 : slOKL 328704 512 = true := by decide +kernel
theorem ok_329216 : slOKL 329216 512 = true := by decide +kernel
theorem ok_329728 : slOKL 329728 512 = true := by decide +kernel
theorem ok_330240 : slOKL 330240 512 = true := by decide +kernel
theorem ok_330752 : slOKL 330752 512 = true := by decide +kernel
theorem ok_331264 : slOKL 331264 512 = true := by decide +kernel
end E1P.OK_ptc
