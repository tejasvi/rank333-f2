module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_184320 : slOKL 184320 512 = true := by decide +kernel
theorem ok_184832 : slOKL 184832 512 = true := by decide +kernel
theorem ok_185344 : slOKL 185344 512 = true := by decide +kernel
theorem ok_185856 : slOKL 185856 512 = true := by decide +kernel
theorem ok_186368 : slOKL 186368 512 = true := by decide +kernel
theorem ok_186880 : slOKL 186880 512 = true := by decide +kernel
theorem ok_187392 : slOKL 187392 512 = true := by decide +kernel
theorem ok_187904 : slOKL 187904 512 = true := by decide +kernel
end E1P.OK_ptc
