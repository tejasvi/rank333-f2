module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_65536 : slOKL 65536 512 = true := by decide +kernel
theorem ok_66048 : slOKL 66048 512 = true := by decide +kernel
theorem ok_66560 : slOKL 66560 512 = true := by decide +kernel
theorem ok_67072 : slOKL 67072 512 = true := by decide +kernel
theorem ok_67584 : slOKL 67584 512 = true := by decide +kernel
theorem ok_68096 : slOKL 68096 512 = true := by decide +kernel
theorem ok_68608 : slOKL 68608 512 = true := by decide +kernel
theorem ok_69120 : slOKL 69120 512 = true := by decide +kernel
end E1P.OK_ptc
