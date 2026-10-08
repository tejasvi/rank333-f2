module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_413696 : slOKL 413696 512 = true := by decide +kernel
theorem ok_414208 : slOKL 414208 512 = true := by decide +kernel
theorem ok_414720 : slOKL 414720 512 = true := by decide +kernel
theorem ok_415232 : slOKL 415232 512 = true := by decide +kernel
theorem ok_415744 : slOKL 415744 512 = true := by decide +kernel
theorem ok_416256 : slOKL 416256 512 = true := by decide +kernel
theorem ok_416768 : slOKL 416768 430 = true := by decide +kernel
end E1P.OK_ptc
