module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_53248 : slOKL 53248 512 = true := by decide +kernel
theorem ok_53760 : slOKL 53760 512 = true := by decide +kernel
theorem ok_54272 : slOKL 54272 512 = true := by decide +kernel
theorem ok_54784 : slOKL 54784 512 = true := by decide +kernel
theorem ok_55296 : slOKL 55296 512 = true := by decide +kernel
theorem ok_55808 : slOKL 55808 512 = true := by decide +kernel
theorem ok_56320 : slOKL 56320 512 = true := by decide +kernel
theorem ok_56832 : slOKL 56832 512 = true := by decide +kernel
end E1P.OK_ptc
