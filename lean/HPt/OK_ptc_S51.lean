module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_208896 : slOKL 208896 512 = true := by decide +kernel
theorem ok_209408 : slOKL 209408 512 = true := by decide +kernel
theorem ok_209920 : slOKL 209920 512 = true := by decide +kernel
theorem ok_210432 : slOKL 210432 512 = true := by decide +kernel
theorem ok_210944 : slOKL 210944 512 = true := by decide +kernel
theorem ok_211456 : slOKL 211456 512 = true := by decide +kernel
theorem ok_211968 : slOKL 211968 512 = true := by decide +kernel
theorem ok_212480 : slOKL 212480 512 = true := by decide +kernel
end E1P.OK_ptc
