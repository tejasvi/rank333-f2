module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_49152 : slOKL 49152 512 = true := by decide +kernel
theorem ok_49664 : slOKL 49664 512 = true := by decide +kernel
theorem ok_50176 : slOKL 50176 512 = true := by decide +kernel
theorem ok_50688 : slOKL 50688 512 = true := by decide +kernel
theorem ok_51200 : slOKL 51200 512 = true := by decide +kernel
theorem ok_51712 : slOKL 51712 512 = true := by decide +kernel
theorem ok_52224 : slOKL 52224 512 = true := by decide +kernel
theorem ok_52736 : slOKL 52736 512 = true := by decide +kernel
end E1P.OK_ptc
