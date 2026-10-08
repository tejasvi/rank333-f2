module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_40960 : slOKL 40960 512 = true := by decide +kernel
theorem ok_41472 : slOKL 41472 512 = true := by decide +kernel
theorem ok_41984 : slOKL 41984 512 = true := by decide +kernel
theorem ok_42496 : slOKL 42496 512 = true := by decide +kernel
theorem ok_43008 : slOKL 43008 512 = true := by decide +kernel
theorem ok_43520 : slOKL 43520 512 = true := by decide +kernel
theorem ok_44032 : slOKL 44032 512 = true := by decide +kernel
theorem ok_44544 : slOKL 44544 512 = true := by decide +kernel
end E1P.OK_ptc
