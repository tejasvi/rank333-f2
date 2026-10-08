module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_225280 : slOKL 225280 512 = true := by decide +kernel
theorem ok_225792 : slOKL 225792 512 = true := by decide +kernel
theorem ok_226304 : slOKL 226304 512 = true := by decide +kernel
theorem ok_226816 : slOKL 226816 512 = true := by decide +kernel
theorem ok_227328 : slOKL 227328 512 = true := by decide +kernel
theorem ok_227840 : slOKL 227840 512 = true := by decide +kernel
theorem ok_228352 : slOKL 228352 512 = true := by decide +kernel
theorem ok_228864 : slOKL 228864 512 = true := by decide +kernel
end E1P.OK_ptc
