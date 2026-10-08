module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_45056 : slOKL 45056 512 = true := by decide +kernel
theorem ok_45568 : slOKL 45568 512 = true := by decide +kernel
theorem ok_46080 : slOKL 46080 512 = true := by decide +kernel
theorem ok_46592 : slOKL 46592 512 = true := by decide +kernel
theorem ok_47104 : slOKL 47104 512 = true := by decide +kernel
theorem ok_47616 : slOKL 47616 512 = true := by decide +kernel
theorem ok_48128 : slOKL 48128 512 = true := by decide +kernel
theorem ok_48640 : slOKL 48640 512 = true := by decide +kernel
end E1P.OK_ptc
