module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_360448 : slOKL 360448 512 = true := by decide +kernel
theorem ok_360960 : slOKL 360960 512 = true := by decide +kernel
theorem ok_361472 : slOKL 361472 512 = true := by decide +kernel
theorem ok_361984 : slOKL 361984 512 = true := by decide +kernel
theorem ok_362496 : slOKL 362496 512 = true := by decide +kernel
theorem ok_363008 : slOKL 363008 512 = true := by decide +kernel
theorem ok_363520 : slOKL 363520 512 = true := by decide +kernel
theorem ok_364032 : slOKL 364032 512 = true := by decide +kernel
end E1P.OK_ptc
