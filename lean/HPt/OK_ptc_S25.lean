module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_102400 : slOKL 102400 512 = true := by decide +kernel
theorem ok_102912 : slOKL 102912 512 = true := by decide +kernel
theorem ok_103424 : slOKL 103424 512 = true := by decide +kernel
theorem ok_103936 : slOKL 103936 512 = true := by decide +kernel
theorem ok_104448 : slOKL 104448 512 = true := by decide +kernel
theorem ok_104960 : slOKL 104960 512 = true := by decide +kernel
theorem ok_105472 : slOKL 105472 512 = true := by decide +kernel
theorem ok_105984 : slOKL 105984 512 = true := by decide +kernel
end E1P.OK_ptc
