module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_147456 : slOKL 147456 512 = true := by decide +kernel
theorem ok_147968 : slOKL 147968 512 = true := by decide +kernel
theorem ok_148480 : slOKL 148480 512 = true := by decide +kernel
theorem ok_148992 : slOKL 148992 512 = true := by decide +kernel
theorem ok_149504 : slOKL 149504 512 = true := by decide +kernel
theorem ok_150016 : slOKL 150016 512 = true := by decide +kernel
theorem ok_150528 : slOKL 150528 512 = true := by decide +kernel
theorem ok_151040 : slOKL 151040 512 = true := by decide +kernel
end E1P.OK_ptc
