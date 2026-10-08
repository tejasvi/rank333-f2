module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_307200 : slOKL 307200 512 = true := by decide +kernel
theorem ok_307712 : slOKL 307712 512 = true := by decide +kernel
theorem ok_308224 : slOKL 308224 512 = true := by decide +kernel
theorem ok_308736 : slOKL 308736 512 = true := by decide +kernel
theorem ok_309248 : slOKL 309248 512 = true := by decide +kernel
theorem ok_309760 : slOKL 309760 512 = true := by decide +kernel
theorem ok_310272 : slOKL 310272 512 = true := by decide +kernel
theorem ok_310784 : slOKL 310784 512 = true := by decide +kernel
end E1P.OK_ptc
