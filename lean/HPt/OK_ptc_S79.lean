module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_323584 : slOKL 323584 512 = true := by decide +kernel
theorem ok_324096 : slOKL 324096 512 = true := by decide +kernel
theorem ok_324608 : slOKL 324608 512 = true := by decide +kernel
theorem ok_325120 : slOKL 325120 512 = true := by decide +kernel
theorem ok_325632 : slOKL 325632 512 = true := by decide +kernel
theorem ok_326144 : slOKL 326144 512 = true := by decide +kernel
theorem ok_326656 : slOKL 326656 512 = true := by decide +kernel
theorem ok_327168 : slOKL 327168 512 = true := by decide +kernel
end E1P.OK_ptc
