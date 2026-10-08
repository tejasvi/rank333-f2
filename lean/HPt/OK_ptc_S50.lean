module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_204800 : slOKL 204800 512 = true := by decide +kernel
theorem ok_205312 : slOKL 205312 512 = true := by decide +kernel
theorem ok_205824 : slOKL 205824 512 = true := by decide +kernel
theorem ok_206336 : slOKL 206336 512 = true := by decide +kernel
theorem ok_206848 : slOKL 206848 512 = true := by decide +kernel
theorem ok_207360 : slOKL 207360 512 = true := by decide +kernel
theorem ok_207872 : slOKL 207872 512 = true := by decide +kernel
theorem ok_208384 : slOKL 208384 512 = true := by decide +kernel
end E1P.OK_ptc
