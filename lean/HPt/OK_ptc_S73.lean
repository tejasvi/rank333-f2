module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_299008 : slOKL 299008 512 = true := by decide +kernel
theorem ok_299520 : slOKL 299520 512 = true := by decide +kernel
theorem ok_300032 : slOKL 300032 512 = true := by decide +kernel
theorem ok_300544 : slOKL 300544 512 = true := by decide +kernel
theorem ok_301056 : slOKL 301056 512 = true := by decide +kernel
theorem ok_301568 : slOKL 301568 512 = true := by decide +kernel
theorem ok_302080 : slOKL 302080 512 = true := by decide +kernel
theorem ok_302592 : slOKL 302592 512 = true := by decide +kernel
end E1P.OK_ptc
