module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_57344 : slOKL 57344 512 = true := by decide +kernel
theorem ok_57856 : slOKL 57856 512 = true := by decide +kernel
theorem ok_58368 : slOKL 58368 512 = true := by decide +kernel
theorem ok_58880 : slOKL 58880 512 = true := by decide +kernel
theorem ok_59392 : slOKL 59392 512 = true := by decide +kernel
theorem ok_59904 : slOKL 59904 512 = true := by decide +kernel
theorem ok_60416 : slOKL 60416 512 = true := by decide +kernel
theorem ok_60928 : slOKL 60928 512 = true := by decide +kernel
end E1P.OK_ptc
