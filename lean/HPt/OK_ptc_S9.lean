module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_36864 : slOKL 36864 512 = true := by decide +kernel
theorem ok_37376 : slOKL 37376 512 = true := by decide +kernel
theorem ok_37888 : slOKL 37888 512 = true := by decide +kernel
theorem ok_38400 : slOKL 38400 512 = true := by decide +kernel
theorem ok_38912 : slOKL 38912 512 = true := by decide +kernel
theorem ok_39424 : slOKL 39424 512 = true := by decide +kernel
theorem ok_39936 : slOKL 39936 512 = true := by decide +kernel
theorem ok_40448 : slOKL 40448 512 = true := by decide +kernel
end E1P.OK_ptc
