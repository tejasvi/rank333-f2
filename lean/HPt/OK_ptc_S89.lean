module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_364544 : slOKL 364544 512 = true := by decide +kernel
theorem ok_365056 : slOKL 365056 512 = true := by decide +kernel
theorem ok_365568 : slOKL 365568 512 = true := by decide +kernel
theorem ok_366080 : slOKL 366080 512 = true := by decide +kernel
theorem ok_366592 : slOKL 366592 512 = true := by decide +kernel
theorem ok_367104 : slOKL 367104 512 = true := by decide +kernel
theorem ok_367616 : slOKL 367616 512 = true := by decide +kernel
theorem ok_368128 : slOKL 368128 512 = true := by decide +kernel
end E1P.OK_ptc
