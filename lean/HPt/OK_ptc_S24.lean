module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_98304 : slOKL 98304 512 = true := by decide +kernel
theorem ok_98816 : slOKL 98816 512 = true := by decide +kernel
theorem ok_99328 : slOKL 99328 512 = true := by decide +kernel
theorem ok_99840 : slOKL 99840 512 = true := by decide +kernel
theorem ok_100352 : slOKL 100352 512 = true := by decide +kernel
theorem ok_100864 : slOKL 100864 512 = true := by decide +kernel
theorem ok_101376 : slOKL 101376 512 = true := by decide +kernel
theorem ok_101888 : slOKL 101888 512 = true := by decide +kernel
end E1P.OK_ptc
