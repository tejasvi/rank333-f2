module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_61440 : slOKL 61440 512 = true := by decide +kernel
theorem ok_61952 : slOKL 61952 512 = true := by decide +kernel
theorem ok_62464 : slOKL 62464 512 = true := by decide +kernel
theorem ok_62976 : slOKL 62976 512 = true := by decide +kernel
theorem ok_63488 : slOKL 63488 512 = true := by decide +kernel
theorem ok_64000 : slOKL 64000 512 = true := by decide +kernel
theorem ok_64512 : slOKL 64512 512 = true := by decide +kernel
theorem ok_65024 : slOKL 65024 512 = true := by decide +kernel
end E1P.OK_ptc
