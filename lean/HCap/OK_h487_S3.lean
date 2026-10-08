module
public import R22Port.U_d41d8cd98f00
public import HCap.OK_h487_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.OK_h487
theorem ok_12288 : slOKL 12288 512 = true := by decide +kernel
theorem ok_12800 : slOKL 12800 512 = true := by decide +kernel
theorem ok_13312 : slOKL 13312 512 = true := by decide +kernel
theorem ok_13824 : slOKL 13824 512 = true := by decide +kernel
theorem ok_14336 : slOKL 14336 512 = true := by decide +kernel
theorem ok_14848 : slOKL 14848 512 = true := by decide +kernel
theorem ok_15360 : slOKL 15360 512 = true := by decide +kernel
theorem ok_15872 : slOKL 15872 512 = true := by decide +kernel
end E1G.OK_h487
