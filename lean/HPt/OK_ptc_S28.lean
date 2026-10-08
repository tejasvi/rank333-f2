module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_114688 : slOKL 114688 512 = true := by decide +kernel
theorem ok_115200 : slOKL 115200 512 = true := by decide +kernel
theorem ok_115712 : slOKL 115712 512 = true := by decide +kernel
theorem ok_116224 : slOKL 116224 512 = true := by decide +kernel
theorem ok_116736 : slOKL 116736 512 = true := by decide +kernel
theorem ok_117248 : slOKL 117248 512 = true := by decide +kernel
theorem ok_117760 : slOKL 117760 512 = true := by decide +kernel
theorem ok_118272 : slOKL 118272 512 = true := by decide +kernel
end E1P.OK_ptc
