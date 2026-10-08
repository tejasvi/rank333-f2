module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_385024 : slOKL 385024 512 = true := by decide +kernel
theorem ok_385536 : slOKL 385536 512 = true := by decide +kernel
theorem ok_386048 : slOKL 386048 512 = true := by decide +kernel
theorem ok_386560 : slOKL 386560 512 = true := by decide +kernel
theorem ok_387072 : slOKL 387072 512 = true := by decide +kernel
theorem ok_387584 : slOKL 387584 512 = true := by decide +kernel
theorem ok_388096 : slOKL 388096 512 = true := by decide +kernel
theorem ok_388608 : slOKL 388608 512 = true := by decide +kernel
end E1P.OK_ptc
