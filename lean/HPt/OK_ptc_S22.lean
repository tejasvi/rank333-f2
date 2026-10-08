module
public import R22Port.U_d41d8cd98f00
public import HPt.OK_ptc_Base
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1P.OK_ptc
theorem ok_90112 : slOKL 90112 512 = true := by decide +kernel
theorem ok_90624 : slOKL 90624 512 = true := by decide +kernel
theorem ok_91136 : slOKL 91136 512 = true := by decide +kernel
theorem ok_91648 : slOKL 91648 512 = true := by decide +kernel
theorem ok_92160 : slOKL 92160 512 = true := by decide +kernel
theorem ok_92672 : slOKL 92672 512 = true := by decide +kernel
theorem ok_93184 : slOKL 93184 512 = true := by decide +kernel
theorem ok_93696 : slOKL 93696 512 = true := by decide +kernel
end E1P.OK_ptc
