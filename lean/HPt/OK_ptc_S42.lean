module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_172032 : slOKL 172032 512 = true := by decide +kernel
theorem ok_172544 : slOKL 172544 512 = true := by decide +kernel
theorem ok_173056 : slOKL 173056 512 = true := by decide +kernel
theorem ok_173568 : slOKL 173568 512 = true := by decide +kernel
theorem ok_174080 : slOKL 174080 512 = true := by decide +kernel
theorem ok_174592 : slOKL 174592 512 = true := by decide +kernel
theorem ok_175104 : slOKL 175104 512 = true := by decide +kernel
theorem ok_175616 : slOKL 175616 512 = true := by decide +kernel
end E1P.OK_ptc
