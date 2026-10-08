module
public import R22Port.U_d41d8cd98f00
public import HCap.OK_h485_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.OK_h485
theorem ok_4096 : slOKL 4096 512 = true := by decide +kernel
theorem ok_4608 : slOKL 4608 512 = true := by decide +kernel
theorem ok_5120 : slOKL 5120 512 = true := by decide +kernel
theorem ok_5632 : slOKL 5632 512 = true := by decide +kernel
theorem ok_6144 : slOKL 6144 512 = true := by decide +kernel
theorem ok_6656 : slOKL 6656 512 = true := by decide +kernel
theorem ok_7168 : slOKL 7168 512 = true := by decide +kernel
theorem ok_7680 : slOKL 7680 512 = true := by decide +kernel
end E1G.OK_h485
