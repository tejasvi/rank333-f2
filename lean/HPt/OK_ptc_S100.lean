module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_409600 : slOKL 409600 512 = true := by decide +kernel
theorem ok_410112 : slOKL 410112 512 = true := by decide +kernel
theorem ok_410624 : slOKL 410624 512 = true := by decide +kernel
theorem ok_411136 : slOKL 411136 512 = true := by decide +kernel
theorem ok_411648 : slOKL 411648 512 = true := by decide +kernel
theorem ok_412160 : slOKL 412160 512 = true := by decide +kernel
theorem ok_412672 : slOKL 412672 512 = true := by decide +kernel
theorem ok_413184 : slOKL 413184 512 = true := by decide +kernel
end E1P.OK_ptc
