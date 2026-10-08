module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_290816 : slOKL 290816 512 = true := by decide +kernel
theorem ok_291328 : slOKL 291328 512 = true := by decide +kernel
theorem ok_291840 : slOKL 291840 512 = true := by decide +kernel
theorem ok_292352 : slOKL 292352 512 = true := by decide +kernel
theorem ok_292864 : slOKL 292864 512 = true := by decide +kernel
theorem ok_293376 : slOKL 293376 512 = true := by decide +kernel
theorem ok_293888 : slOKL 293888 512 = true := by decide +kernel
theorem ok_294400 : slOKL 294400 512 = true := by decide +kernel
end E1P.OK_ptc
