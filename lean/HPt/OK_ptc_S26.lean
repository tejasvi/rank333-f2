module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_106496 : slOKL 106496 512 = true := by decide +kernel
theorem ok_107008 : slOKL 107008 512 = true := by decide +kernel
theorem ok_107520 : slOKL 107520 512 = true := by decide +kernel
theorem ok_108032 : slOKL 108032 512 = true := by decide +kernel
theorem ok_108544 : slOKL 108544 512 = true := by decide +kernel
theorem ok_109056 : slOKL 109056 512 = true := by decide +kernel
theorem ok_109568 : slOKL 109568 512 = true := by decide +kernel
theorem ok_110080 : slOKL 110080 512 = true := by decide +kernel
end E1P.OK_ptc
