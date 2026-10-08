module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_188416 : slOKL 188416 512 = true := by decide +kernel
theorem ok_188928 : slOKL 188928 512 = true := by decide +kernel
theorem ok_189440 : slOKL 189440 512 = true := by decide +kernel
theorem ok_189952 : slOKL 189952 512 = true := by decide +kernel
theorem ok_190464 : slOKL 190464 512 = true := by decide +kernel
theorem ok_190976 : slOKL 190976 512 = true := by decide +kernel
theorem ok_191488 : slOKL 191488 512 = true := by decide +kernel
theorem ok_192000 : slOKL 192000 512 = true := by decide +kernel
end E1P.OK_ptc
