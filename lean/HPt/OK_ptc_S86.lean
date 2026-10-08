module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_352256 : slOKL 352256 512 = true := by decide +kernel
theorem ok_352768 : slOKL 352768 512 = true := by decide +kernel
theorem ok_353280 : slOKL 353280 512 = true := by decide +kernel
theorem ok_353792 : slOKL 353792 512 = true := by decide +kernel
theorem ok_354304 : slOKL 354304 512 = true := by decide +kernel
theorem ok_354816 : slOKL 354816 512 = true := by decide +kernel
theorem ok_355328 : slOKL 355328 512 = true := by decide +kernel
theorem ok_355840 : slOKL 355840 512 = true := by decide +kernel
end E1P.OK_ptc
