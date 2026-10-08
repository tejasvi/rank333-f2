module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_94208 : slOKL 94208 512 = true := by decide +kernel
theorem ok_94720 : slOKL 94720 512 = true := by decide +kernel
theorem ok_95232 : slOKL 95232 512 = true := by decide +kernel
theorem ok_95744 : slOKL 95744 512 = true := by decide +kernel
theorem ok_96256 : slOKL 96256 512 = true := by decide +kernel
theorem ok_96768 : slOKL 96768 512 = true := by decide +kernel
theorem ok_97280 : slOKL 97280 512 = true := by decide +kernel
theorem ok_97792 : slOKL 97792 512 = true := by decide +kernel
end E1P.OK_ptc
