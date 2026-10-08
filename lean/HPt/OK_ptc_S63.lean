module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_258048 : slOKL 258048 512 = true := by decide +kernel
theorem ok_258560 : slOKL 258560 512 = true := by decide +kernel
theorem ok_259072 : slOKL 259072 512 = true := by decide +kernel
theorem ok_259584 : slOKL 259584 512 = true := by decide +kernel
theorem ok_260096 : slOKL 260096 512 = true := by decide +kernel
theorem ok_260608 : slOKL 260608 512 = true := by decide +kernel
theorem ok_261120 : slOKL 261120 512 = true := by decide +kernel
theorem ok_261632 : slOKL 261632 512 = true := by decide +kernel
end E1P.OK_ptc
