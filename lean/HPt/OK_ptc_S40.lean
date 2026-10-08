module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_163840 : slOKL 163840 512 = true := by decide +kernel
theorem ok_164352 : slOKL 164352 512 = true := by decide +kernel
theorem ok_164864 : slOKL 164864 512 = true := by decide +kernel
theorem ok_165376 : slOKL 165376 512 = true := by decide +kernel
theorem ok_165888 : slOKL 165888 512 = true := by decide +kernel
theorem ok_166400 : slOKL 166400 512 = true := by decide +kernel
theorem ok_166912 : slOKL 166912 512 = true := by decide +kernel
theorem ok_167424 : slOKL 167424 512 = true := by decide +kernel
end E1P.OK_ptc
