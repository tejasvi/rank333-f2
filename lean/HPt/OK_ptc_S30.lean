module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_122880 : slOKL 122880 512 = true := by decide +kernel
theorem ok_123392 : slOKL 123392 512 = true := by decide +kernel
theorem ok_123904 : slOKL 123904 512 = true := by decide +kernel
theorem ok_124416 : slOKL 124416 512 = true := by decide +kernel
theorem ok_124928 : slOKL 124928 512 = true := by decide +kernel
theorem ok_125440 : slOKL 125440 512 = true := by decide +kernel
theorem ok_125952 : slOKL 125952 512 = true := by decide +kernel
theorem ok_126464 : slOKL 126464 512 = true := by decide +kernel
end E1P.OK_ptc
