module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_86016 : slOKL 86016 512 = true := by decide +kernel
theorem ok_86528 : slOKL 86528 512 = true := by decide +kernel
theorem ok_87040 : slOKL 87040 512 = true := by decide +kernel
theorem ok_87552 : slOKL 87552 512 = true := by decide +kernel
theorem ok_88064 : slOKL 88064 512 = true := by decide +kernel
theorem ok_88576 : slOKL 88576 512 = true := by decide +kernel
theorem ok_89088 : slOKL 89088 512 = true := by decide +kernel
theorem ok_89600 : slOKL 89600 512 = true := by decide +kernel
end E1P.OK_ptc
