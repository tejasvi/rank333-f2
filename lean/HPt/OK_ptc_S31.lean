module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_126976 : slOKL 126976 512 = true := by decide +kernel
theorem ok_127488 : slOKL 127488 512 = true := by decide +kernel
theorem ok_128000 : slOKL 128000 512 = true := by decide +kernel
theorem ok_128512 : slOKL 128512 512 = true := by decide +kernel
theorem ok_129024 : slOKL 129024 512 = true := by decide +kernel
theorem ok_129536 : slOKL 129536 512 = true := by decide +kernel
theorem ok_130048 : slOKL 130048 512 = true := by decide +kernel
theorem ok_130560 : slOKL 130560 512 = true := by decide +kernel
end E1P.OK_ptc
