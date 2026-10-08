module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_401408 : slOKL 401408 512 = true := by decide +kernel
theorem ok_401920 : slOKL 401920 512 = true := by decide +kernel
theorem ok_402432 : slOKL 402432 512 = true := by decide +kernel
theorem ok_402944 : slOKL 402944 512 = true := by decide +kernel
theorem ok_403456 : slOKL 403456 512 = true := by decide +kernel
theorem ok_403968 : slOKL 403968 512 = true := by decide +kernel
theorem ok_404480 : slOKL 404480 512 = true := by decide +kernel
theorem ok_404992 : slOKL 404992 512 = true := by decide +kernel
end E1P.OK_ptc
