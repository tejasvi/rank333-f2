module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_389120 : slOKL 389120 512 = true := by decide +kernel
theorem ok_389632 : slOKL 389632 512 = true := by decide +kernel
theorem ok_390144 : slOKL 390144 512 = true := by decide +kernel
theorem ok_390656 : slOKL 390656 512 = true := by decide +kernel
theorem ok_391168 : slOKL 391168 512 = true := by decide +kernel
theorem ok_391680 : slOKL 391680 512 = true := by decide +kernel
theorem ok_392192 : slOKL 392192 512 = true := by decide +kernel
theorem ok_392704 : slOKL 392704 512 = true := by decide +kernel
end E1P.OK_ptc
