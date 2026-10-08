module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_196608 : slOKL 196608 512 = true := by decide +kernel
theorem ok_197120 : slOKL 197120 512 = true := by decide +kernel
theorem ok_197632 : slOKL 197632 512 = true := by decide +kernel
theorem ok_198144 : slOKL 198144 512 = true := by decide +kernel
theorem ok_198656 : slOKL 198656 512 = true := by decide +kernel
theorem ok_199168 : slOKL 199168 512 = true := by decide +kernel
theorem ok_199680 : slOKL 199680 512 = true := by decide +kernel
theorem ok_200192 : slOKL 200192 512 = true := by decide +kernel
end E1P.OK_ptc
