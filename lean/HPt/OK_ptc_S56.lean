module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_229376 : slOKL 229376 512 = true := by decide +kernel
theorem ok_229888 : slOKL 229888 512 = true := by decide +kernel
theorem ok_230400 : slOKL 230400 512 = true := by decide +kernel
theorem ok_230912 : slOKL 230912 512 = true := by decide +kernel
theorem ok_231424 : slOKL 231424 512 = true := by decide +kernel
theorem ok_231936 : slOKL 231936 512 = true := by decide +kernel
theorem ok_232448 : slOKL 232448 512 = true := by decide +kernel
theorem ok_232960 : slOKL 232960 512 = true := by decide +kernel
end E1P.OK_ptc
