module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_131072 : slOKL 131072 512 = true := by decide +kernel
theorem ok_131584 : slOKL 131584 512 = true := by decide +kernel
theorem ok_132096 : slOKL 132096 512 = true := by decide +kernel
theorem ok_132608 : slOKL 132608 512 = true := by decide +kernel
theorem ok_133120 : slOKL 133120 512 = true := by decide +kernel
theorem ok_133632 : slOKL 133632 512 = true := by decide +kernel
theorem ok_134144 : slOKL 134144 512 = true := by decide +kernel
theorem ok_134656 : slOKL 134656 512 = true := by decide +kernel
end E1P.OK_ptc
