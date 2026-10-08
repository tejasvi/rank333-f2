module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_118784 : slOKL 118784 512 = true := by decide +kernel
theorem ok_119296 : slOKL 119296 512 = true := by decide +kernel
theorem ok_119808 : slOKL 119808 512 = true := by decide +kernel
theorem ok_120320 : slOKL 120320 512 = true := by decide +kernel
theorem ok_120832 : slOKL 120832 512 = true := by decide +kernel
theorem ok_121344 : slOKL 121344 512 = true := by decide +kernel
theorem ok_121856 : slOKL 121856 512 = true := by decide +kernel
theorem ok_122368 : slOKL 122368 512 = true := by decide +kernel
end E1P.OK_ptc
