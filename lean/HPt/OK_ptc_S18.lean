module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_73728 : slOKL 73728 512 = true := by decide +kernel
theorem ok_74240 : slOKL 74240 512 = true := by decide +kernel
theorem ok_74752 : slOKL 74752 512 = true := by decide +kernel
theorem ok_75264 : slOKL 75264 512 = true := by decide +kernel
theorem ok_75776 : slOKL 75776 512 = true := by decide +kernel
theorem ok_76288 : slOKL 76288 512 = true := by decide +kernel
theorem ok_76800 : slOKL 76800 512 = true := by decide +kernel
theorem ok_77312 : slOKL 77312 512 = true := by decide +kernel
end E1P.OK_ptc
