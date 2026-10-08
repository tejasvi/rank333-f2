module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_32768 : slOKL 32768 512 = true := by decide +kernel
theorem ok_33280 : slOKL 33280 512 = true := by decide +kernel
theorem ok_33792 : slOKL 33792 512 = true := by decide +kernel
theorem ok_34304 : slOKL 34304 512 = true := by decide +kernel
theorem ok_34816 : slOKL 34816 512 = true := by decide +kernel
theorem ok_35328 : slOKL 35328 512 = true := by decide +kernel
theorem ok_35840 : slOKL 35840 512 = true := by decide +kernel
theorem ok_36352 : slOKL 36352 512 = true := by decide +kernel
end E1P.OK_ptc
