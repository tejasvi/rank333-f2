module
public import R22Port.U_d41d8cd98f00
public import HCap.OK_h485_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.OK_h485
theorem ok_8192 : slOKL 8192 512 = true := by decide +kernel
theorem ok_8704 : slOKL 8704 512 = true := by decide +kernel
theorem ok_9216 : slOKL 9216 512 = true := by decide +kernel
theorem ok_9728 : slOKL 9728 512 = true := by decide +kernel
theorem ok_10240 : slOKL 10240 512 = true := by decide +kernel
theorem ok_10752 : slOKL 10752 512 = true := by decide +kernel
theorem ok_11264 : slOKL 11264 512 = true := by decide +kernel
theorem ok_11776 : slOKL 11776 512 = true := by decide +kernel
end E1G.OK_h485
