module
public import R22Port.U_d41d8cd98f00
public import HCap.OK_h485_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.OK_h485
theorem ok_16384 : slOKL 16384 512 = true := by decide +kernel
theorem ok_16896 : slOKL 16896 512 = true := by decide +kernel
theorem ok_17408 : slOKL 17408 512 = true := by decide +kernel
theorem ok_17920 : slOKL 17920 512 = true := by decide +kernel
theorem ok_18432 : slOKL 18432 512 = true := by decide +kernel
theorem ok_18944 : slOKL 18944 512 = true := by decide +kernel
theorem ok_19456 : slOKL 19456 512 = true := by decide +kernel
theorem ok_19968 : slOKL 19968 512 = true := by decide +kernel
end E1G.OK_h485
