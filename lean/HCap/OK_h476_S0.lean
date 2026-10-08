module
public import R22Port.U_d41d8cd98f00
public import HCap.OK_h476_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1G.OK_h476
theorem ok_0 : slOKL 0 512 = true := by decide +kernel
theorem ok_512 : slOKL 512 512 = true := by decide +kernel
theorem ok_1024 : slOKL 1024 512 = true := by decide +kernel
theorem ok_1536 : slOKL 1536 512 = true := by decide +kernel
theorem ok_2048 : slOKL 2048 512 = true := by decide +kernel
theorem ok_2560 : slOKL 2560 263 = true := by decide +kernel
end E1G.OK_h476
